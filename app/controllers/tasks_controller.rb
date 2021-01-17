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
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :tasks
    else
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
      @task = Task.find(params[:id])
      if @task.update(private)
        flash[:notice] = "タイトル「#{@task.title}」のスケジュールを更新しました。"
        redirect_to :tasks
      else
        render "edit"
      end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
    flash[:notice]  = "スケジュールが削除されました"
    redirect_to :tasks
    end
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
