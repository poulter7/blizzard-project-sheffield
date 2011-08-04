class ParticipantController < ApplicationController
  def update
    @participant = Participant.find(params[:id])
    @questionIndex = params[:index].to_i
    @questionAnswer= params[:input]
    section = @participant.section
    # if the array element doesn't already have soemthing in it fill it in
    # and move onto next question
    if @participant.answers[@questionIndex].nil?
      @participant.answers[@questionIndex] = @questionAnswer
      @participant.save!
      # now the next question should become available
      nextIndex = @participant.currentQuestion
      if nextIndex
        redirect_to answer_section_task_path section, :index => nextIndex
      else
        # if no question then we're done
        redirect_to section_index_path
      end
    else
      redirect_to section_index_path
    end

  end
end
