class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.all
    @tasks = current_user.tasks.paginate(page: params[:page], per_page: 10)
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

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id]) 
    if @task.update_attributes(tasks_params)
      flash[:notice] = "Task was updated."
      redirect_to @task
      else
       flash[:error] = "There was an error saving the task. Please try again."
      render :index
    end
  end

def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_path, :notice => "Completed!"
end

  private

  def tasks_params
    params.require(:task).permit(:name)
  end


end
# strong parameters