class Listeningtest < ActiveRecord::Base
  def sections
    Section.find_all_by_listeningtest_id(self.id)
  end

  def answers_from(participant)
      sections.map{ |s| Answer.where(:participant_id => participant.id, :section_id => s.id).first}.keep_if{|a| !a.nil?}
  end

  def completed_by?(participant)
    answers_from(participant).all?{|a| a.completed?}
  end

end
