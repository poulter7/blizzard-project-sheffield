class ListeningtestController < ApplicationController

  # display the listeningtest page to a user
  def index
    user = warden.user
    @participants = Participant.find_all_by_user_id(user.id)
    p= @participants.first
    if !p.nil? && p.listeningtest.completed_by?(p)
       redirect_to :action => :completed, :test_id => p.listeningtest.id
    end
  end

  # the user has completed their test and should now be processed
  def completed
    @a='a'
  end

end
