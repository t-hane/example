class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        @task = Task.new
    end

    def create
        Task.transaction do
            @task = Task.new params.require(:task)
                            .permit(
                                :title,
                                 :member_id, :content)
            @task.save!
            redirect_to task_path(@task)
        end
    rescue ActiveRecord::RecordInvalid
        render action: :new
    end
    
    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task.update_attributes! params.require(:task)
                        .permit(:title, :member_id, :content)
        redirect_to task_path(@task)
    end
end
