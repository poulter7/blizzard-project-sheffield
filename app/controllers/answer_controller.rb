class AnswerController < ApplicationController
  before_filter :authenticate_user!

  def update
    answer = Answer.find_by_id(params[:id])
    ans = answer.answer_list
    if ans[params[:index].to_i].nil?
      ans[params[:index].to_i] = params[:input]
      answer.update_attributes(:answer_list => ans)
    end
    section = answer.section
    nextIndex = answer.participant.currentQuestion(section)
    if nextIndex
      redirect_to answer_section_task_path section, :index => nextIndex
    else
      # if no question then we're done
      redirect_to listeningtest_index_path
    end
  end

  def answer
    @section = Section.find(params[:section_id])
    @participant = Participant.find_by_user_id(warden.user.id)
    @answer = Answer.where(:participant_id => @participant.id, :section_id => @section.id).first
    render :show
  end
end
