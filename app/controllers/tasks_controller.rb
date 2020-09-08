class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: [:show, :edit, :update]
  
  def index
    @tasks=Task.all
  end
  def show
  end
  def edit
  end
  def update
    @task.task_name=params[:task][:task_name]
    @task.detail=params[:task][:detail]
    @task.save
    redirect_to user_tasks_url(@user, @task)
  end
  def new
  end
  def create
    @task=Task.new(task_name: params[:task_name], detail: params[:detail])
    @task.save
    redirect_to user_tasks_url
  end
  private
  def set_user
      @user = User.find(params[:user_id])
  end
  def set_task
      @task=Task.find(params[:id])
  end
  def task_params
      params.require(:task).permit(:task_name, :detail)
  end
end
