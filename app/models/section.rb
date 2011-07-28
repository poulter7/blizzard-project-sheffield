class Section < ActiveRecord::Base
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
