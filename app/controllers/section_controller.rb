class SectionController < ApplicationController
  before_filter :authenticate_user!

  # show the current section, by displaying the current question a user must answer to progress into the section
  # if there is no answerable question return to the testing page
  def show
    # TODO instead of showing anything about a particular section
    # render the content of the current question
    @participant = Participant.find_by_user_id(warden.user.id)
    @section = Section.find(params[:id])
    @currentQuestion = @participant.currentQuestion(@section)
    if @section.nil? # no current section
      redirect_to listeningtest_index_path
    elsif @currentQuestion # no current
      # redirect to the task that should be being done
      redirect_to answer_section_task_path @section.id, :index => @currentQuestion
    else
      redirect_to listeningtest_index_path
    end
  end

end
