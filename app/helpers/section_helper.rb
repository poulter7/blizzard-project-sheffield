module SectionHelper
  
  #def user_tasks
  #end

  def user_tasks_count
    return user_tasks.size
  end


  def tasks
      return Task.find_all_by_section_id(id)
  end


end
