class AmazonController < ApplicationController

  def welcome
    # if the user has accepted the hit present them with the task
    hitId = params[:hitId]
    workerId = params[:workerId]
    if !hitId
      # the viewer isn't from an Amazon page, so show the the outside viewer page
      render :outside
    elsif !workerId
      # the Turker hasn't accepted the hit as yet
      render :turk
    else 
      render :welcome
    end


    # else present a welcome page
  end
end
