class SectionController < ApplicationController
  before_filter :authenticate_user!

  # for the given user find all of the experiments they are participating in
  def index
    # FIXME currently only one test
    @participant = Participant.find_by_user_id(warden.user.id)
    unless @participant.blank?
      @sections = Section.find_all_by_id(@participant.section_id)
    end
  end

  # show the current section, by displaying the current question a user must answer to progress into the section
  # if there is no answerable question return to the testing page
  def show
    # TODO instead of showing anything about a particular section
    # render the content of the current question
    @section = Section.find(params[:id])
    if @section.nil?
      redirect_to :action => 'index'
    else
      # redirect to the task that should be being done
      # index = @section.nextIndex
      index = 1
      redirect_to section_task_answer_path @section.id, :index => index
    end
  end

end
