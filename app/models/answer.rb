class Answer < ActiveRecord::Base
  belongs_to :participant
  belongs_to :section
  serialize  :answer_list

  def answered_count
    answer_list.count{|a|!a.nil?}
  end

  def answered?(index)
    !answer_list[index].nil?
  end

  def completed?
    answer_list.all?{|a| !a.nil?}
  end

end
