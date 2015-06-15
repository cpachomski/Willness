class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @task.save
        format.html {redirect_to @task}
        format.json {render action: 'show', status: :created, location: @task}
        format.js   {render action: 'show', status: :created, location: @task}
      else
        format.html {render action: 'new'}
        format.json {render json: @task.errors, status: :unprocessable_entity}
        format.js   {render json: @task.errors, status: :unprocessable_entity}
      end
  end


  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to(:back)
  end


  private

  def task_params
    params.require(:task).permit(:title, :description, :value, :category)
  end

end
