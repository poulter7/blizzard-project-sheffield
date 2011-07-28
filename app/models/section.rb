class Section < ActiveRecord::Base
  serialize :static_links
  serialize :pool_links
  serialize :subjects

  def getPlaylist(user)
    return 0
  end

  def latinSqSize
    return subjects.count
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
