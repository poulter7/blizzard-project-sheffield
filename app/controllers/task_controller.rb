class TaskController < ApplicationController
  before_filter :authenticate_user!


  def show
    # TODO redirect if already answered
    @task = Task.find(params[:id])
  end

  def update

    @task = Task.update(params[:id], params[:task])
    @section = Section.find(@task.taskset_id)
    # try and find a valid task to progress to
    # next higher and unanswered task
    t_ind = @section.tasks.index{|t| (t.index > @task.index && !t.answered)}

    # if there is one, progress else return to main section
    if (t_ind)
      redirect_to [@section, @taskset.tasks[t_ind]]
    else
      redirect_to @section
    end
  end

end
