class Answer < ActiveRecord::Base
  belongs_to :participant
  belongs_to :section
  serialize  :answer_list

  def answered_count
    return self.answer_list.count{|a|!a.nil?}
  end

  def isanswered?(index)
    self.answer_list[index]
  end

  def iscompleted?

  end
end
