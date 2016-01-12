class TasksController < ApplicationController

	def index
		@tasks = Task.all.order(end: :asc)
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		@task.status = false
		@task.save
		respond_to do |format|
			format.html{redirect_to tasks_path}
			format.js{}
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
		@task.update(task_params)
		respond_to do |format|
			format.html{redirect_to task_path}
			format.js{}
		end
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		respond_to do |format|
			format.html{redirect_to tasks_path}
			format.js{}
		end
	end

	def mark_complete
		@task = Task.find(params[:id])
		@task.status = true
		@task.save
		respond_to do |format|
			format.html{redirect_to :back}
			format.js{}
		end
	end

	def mark_incomplete
		@task = Task.find(params[:id])
		@task.status = false
		@task.save
		respond_to do |format|
			format.html{redirect_to :back}
			format.js{}
		end
	end

	private
		def task_params
			params.require(:task).permit(:name,:desc,:start,:end)
		end
end
