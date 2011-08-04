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
    r = Participant.count(:conditions => "section_id = #{self.id}", :group => 'listenergroup')
    
    # map to the original participants group
    r.each {|group, count| partCounts[group] = count}

    return partCounts
  end

  # here 1 is taken from listener group and trackID
  # to return to zero indexing
  # get order systems are to be played in
  # ['system', ...]
  def subjectOrdering(participant)
    return latinsquare[participant.listenergroup].map{|sID|  subjects[sID-1]} 
  end

    # get the file and system together
    # ['system/fileloc', ...]
  def getPlaylist(participant)
    return subjectOrdering(participant).zip(pool_links).map{|sub,file| File.join(sub,file)}

  end

  def getFile(participant, index)
    return self.getPlaylist(participant)[index]
  end

  def getClip(index)
    pool_links[index%latinSqSize]
  end

  def latinSqSize
    return subjects.count
  end

  def getSystem(participant, index)
    return subjectOrdering(participant)[index]
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
