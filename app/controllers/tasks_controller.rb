class TasksController < ApplicationController
  def index
    @task = current_user.tasks.all
  end

  def create
    @task = current_user.tasks.build(tasks_params)
    if @task.save
      flash[:notice] = "Awesome, wiki was created successfully!"
      redirect_to @task
    else
      flash[:error] = "There was an error creating the wiki. Please try again"
      
    end
  end

end
# strong parameters