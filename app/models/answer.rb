class Answer < ActiveRecord::Base
  belongs_to :participant
  belongs_to :section
  serialize  :answer_list
end
