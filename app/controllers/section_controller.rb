class SectionController < ApplicationController
  before_filter :authenticate_user!

  def index
    @sections = Section.find_all_by_user_id(warden.user.id)
  end

  def show
    @section = Section.find(params[:id])
    if @section.nil?
      redirect_to :action => 'index'
    else
      @tasks = @section.tasks
    end
  end
end
