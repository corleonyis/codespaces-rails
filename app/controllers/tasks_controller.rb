class TasksController < ApplicationController
	protect_from_forgery

	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.create(task_params)
		redirect_to tasks_path
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		@task.update(task_params)
		redirect_to tasks_path
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy

		respond_to do |format|
			format.html { redirect_to tasks_path, notice: "Task was successfully destroyed.", status: :see_other}
			format.json { head :no_content }
		end
	end

	def show
		@task = Task.find(params[:id])
	end

	private
		def task_params
			params.require(:task).permit(:title)
		end
end
