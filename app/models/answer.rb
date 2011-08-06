class Answer < ActiveRecord::Base
  belongs_to :participant
  belongs_to :section
  serialize  :answer_list

  def answered_count
    answer_list.count{|a|!a.nil?}
  end
end
