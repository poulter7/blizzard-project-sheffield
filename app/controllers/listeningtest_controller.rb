class ListeningtestController < ApplicationController
  def index
    @participants = Participant.find_all_by_user_id(warden.user.id)
  end
end
