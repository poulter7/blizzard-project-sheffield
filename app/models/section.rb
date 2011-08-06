class Section < ActiveRecord::Base
  serialize :static_links
  serialize :pool_links
  serialize :subjects
  belongs_to :listeningtest

  # find the number of participants in each listening groups
  def getListenergroupParticipants
    partCounts=Array.new(latinSqSize,0)

    # find all the participants taking part in this section
    # group by listener groups
    lgroup = Answer.count(:conditions => "section_id = #{self.id}", :group => 'listenergroup')
    
    # map to the original participants group
    lgroup.each {|group, count| partCounts[group] = count}

    return partCounts
  end

  # the group with the smallest number of current answers should be the assigned listenergroup
  def getListenergroupAssignment
    lgroups = getListenergroupParticipants
    return lgroups.index(lgroups.min)
  end



  # here 1 is taken from listener group and trackID
  # to return to zero indexing
  # get order systems are to be played in
  # ['system', ...]
  def subjectOrdering(listenergroup)
    return latinsquare[listenergroup].map{|sID|  subjects[sID-1]} 
  end

    # get the file and system together
    # ['system/fileloc', ...]
  def getPlaylist(listenergroup)
    return subjectOrdering(listenergroup).zip(pool_links).map{|sub,file| File.join(sub,file)}

  end

  def getFile(listenergroup, index)
    return self.getPlaylist(listenergroup)[index]
  end

  def getClip(index)
    pool_links[index%pool_links.count]
  end

  def latinSqSize
    return subjects.count
  end

  # return the system which is the subject of this question
  def getSystem(submission, index)
    return subjectOrdering(submission)[index]
  end

  # load the latin square for this section
  # find the files and split on each line to make arrays of numbers
  # these are stored are strings, so s.to_i will give arrays of ints
  def latinsquare
    @laSquare = []
    @file = Rails.root.join('resources', 'latin_squares',"#{self.latinSqSize}.square")

    File.open(@file, "r") do |file| 
      file.each_line do |line|
        @laSquare << line.split("\ ").map{|s| s.to_i}
      end
    end

    return @laSquare
  end


end
