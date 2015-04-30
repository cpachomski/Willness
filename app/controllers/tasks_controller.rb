class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))
    if @task.save
      redirect_to current_user
    else
      render 'landing/home'
    end
  end


  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to(:back)
  end


  private

  def task_params
    params.require(:tasks).permit(:title, :description, :value, :category)
  end

end
