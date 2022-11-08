class TasksController < ApplicationController
  # Create
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Read
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  # Update
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  # Destroy
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    # Strong params -> we are filtering the attributes from the form
    params.require(:task).permit(:title, :details, :completed)
  end
end
