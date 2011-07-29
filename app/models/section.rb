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

  def getPlaylist(user)
    # here 1 is taken from listener group and trackID
    # to return to zero indexing
    # get order systems are to be played in
    # ['system', ...]
    subjectOrdering = latinsquare[user.listenergroup].map{|sID|  subjects[sID-1]} 

    # get the file and system together
    # ['system/fileloc', ...]
    return subjectOrdering.zip(pool_links).map{|sub,file| File.join(sub,file)}

  end

  def getFile(user, id)
    return self.getPlaylist(user)[id]
  end

  def latinSqSize
    return subjects.count
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

  def tasks
      return Task.find_all_by_section_id(id).sort {|x,y| x.index <=> y.index}
  end

  def tasks_count
    return tasks.count
  end

  def tasks_answered_count
    return tasks.count {|t| t.answered}
  end
end
