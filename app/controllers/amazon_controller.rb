class AmazonController < ApplicationController


  # present the correct welcome page
  def welcome
    sign_out_all_scopes
    # if the user has accepted the hit present them with the task
    hitId = params[:hitId]
    workerId = params[:workerId]

    if !hitId
      # the viewer isn't from an Amazon page, so show the the outside viewer page
      render :outside

    elsif !workerId
      # the Turker hasn't accepted the hit as yet
      render :pending

    else 

      email = "#{workerId.downcase}@amazonturk.user"
      # the viewer is from Amazon and has a valid workerID, set them up a user
      amazonUser = User.find_or_create_by_email(:email => email){ |u| u.usergroup = 'A'}


      # the amazon user has been created or found, now make them a participant of the current
      amazonParticipant = Participant.find_or_create_by_user_id( amazonUser.id){ |p| p.listeningtest_id = 1}

      @participants = Participant.find_all_by_user_id(amazonUser.id)

      sign_in(amazonUser)    
      redirect_to :controller => 'listeningtest', :action => 'index'
    end

  end

end

