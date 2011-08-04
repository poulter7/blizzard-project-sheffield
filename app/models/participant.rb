class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :section
  serialize :answers

  before_create do
    # place the participant into a listening group
    #  everything but NIL and false in Ruby is false
    unless self.answers
      self.answers = Array.new(section.latinSqSize)
    end
    unless self.listenergroup
      self.listenergroup = 1
    end
  end

  def currentQuestion
    return self.answers.index{|a| a.nil?}
  end
  
  def answeredCount
    return self.answers.count{|a|!a.nil?}
  end

end
