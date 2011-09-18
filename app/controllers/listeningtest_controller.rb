class ListeningtestController < ApplicationController

  # display the listeningtest page to a user
  def index
    user = warden.user
    @participants = Participant.find_all_by_user_id(user.id)
    p= @participants.first
    if !p.nil? && p.listeningtest.completed_by?(p)

       # the user has completed their test and should now be processed
       render :completed 
    end
  end

end
