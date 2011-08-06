class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :listeningtest
  serialize :listenergroup

  after_create do
    # place the participant into a listening group
    #  everything but NIL and false in Ruby is false
    #  TODO can pre-allocate answer objects here
    @sections = Section.find_all_by_listeningtest_id(listeningtest.id)
    @sections.each do |section|
      Answer.create(
        :participant_id => self.id,
        :section_id => section.id,
        :listenergroup => 1,
        :answer_list => Array.new(section.latinSqSize))
    end
  end

  def answer_list(section)
    return Answer.where(:participant_id => self.id, :section_id => section.id).first.answer_list
  end

  def currentQuestion(section)
    return self.answer_list(section).index{|a| a.nil?}
  end
  
  def answeredCount(section)
    return self.answer_list(section).count{|a|!a.nil?}
  end

end
