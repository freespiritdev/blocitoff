class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.all
  end

  def create
    @task = current_user.tasks.build(tasks_params)
    if @task.save
      flash[:notice] = "Awesome, task was created successfully!"
      redirect_to tasks_url
    else
      flash[:error] = "There was an error creating the task. Please try again"
      render :new
    end
  end

  def new
    @task = Task.new
  end

  def update
    @task = Task.friendly.find(params[:user_id])
    #@wiki = Wiki.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:notice] = "Task was updated."
      redirect_to @task
      else
       flash[:error] = "There was an error saving the task. Please try again."
      render :index
    end
  end



  private

  def tasks_params
    params.require(:task).permit(:name)
  end


end
# strong parameters