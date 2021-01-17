class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(private)
    if @task.save
      redirect_to :tasks
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def private
    params.require(:task).permit(
      :title,
      :start_time,
      :end_time,
      :all_day,
      :content)
  end
end
