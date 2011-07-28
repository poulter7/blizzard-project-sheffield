class Task < ActiveRecord::Base
  serialize :elements

  def answered
    !answer.nil?
  end

  def subject
    Resource.find(subject_id).location
  end

  def section
    Section.find(section_id)
  end
  
  def question
    Question.find(question_id).text
  end

  def resources
    elements.map {|e| Resource.find(e)}
  end

  def resource_locations
    resources.map {|r| r.location}
  end


end
