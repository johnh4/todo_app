class TasksController < ApplicationController

  def new
  	@task = Task.new
  end

  def index

  	@tasks = Task.all
  	@incomplete = Task.where(completed:  false)
  	@complete = Task.where(completed: true)
  end

  def create
  	#@task = Task.new(task_params)

  	@task = Task.new(params[:task])
  	#
  	if @task.save
  		flash[:success] = "Task added successfully"
  		#render :index
  		redirect_to tasks_path
  	else
  		flash[:notice] = "Task failed"
  		redirect_to tasks_path
  	end

  end

  def update
  	@task = Task.find(params[:id])
  	@task.update_attributes!(params[:task])

  	respond_to do |format|
  		format.html { redirect_to tasks_path }
  		format.js
  	end
  end

  def show
  	@task = Task.find(params[:id])
  end

  def destroy
  	@task = Task.find(params[:id])
  	@task.destroy
  	respond_to do |format|
  		format.html { redirect_to tasks_path }
  		format.js
  	end
  end



  private

  def task_params
      #params.require(:task).permit(:content)
  end

end
