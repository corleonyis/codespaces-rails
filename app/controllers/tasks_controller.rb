class TasksController < ApplicationController
	protect_from_forgery
	before_action :require_login
	before_action :user_check, {only:[:edit, :update, :destroy, :show]}

	def index
		@tasks = Task.where(user_id: current_user.id)
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.create(task_params)
		redirect_to tasks_path
	end

	def edit
		user_check
	end

	def update
		user_check
		@task.update(task_params)
		redirect_to tasks_path
	end

	def destroy
		user_check
		@task.destroy

		respond_to do |format|
			format.html { redirect_to tasks_path, notice: "Task was successfully destroyed.", status: :see_other}
			format.json { head :no_content }
		end
	end

	def show
		user_check
	end

	private
		def task_params
			params.require(:task).permit(:title, :done).merge(user_id: current_user.id)
		end

		def user_check
			@task = Task.find(params[:id])
			if @task.user_id != current_user.id
				redirect_to tasks_path
			end
		end
end
