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
            task_params = params.require(:task)
                                .permit(:title, :member_id, :content)
            @task = Task.new task_params
            @task.save!
        end
    rescue ActiveRecord::RecordInvalid
        render action: :new
    end
    
    def edit
        @task = Task.find(params[:id])
    end

    def update
        Task.transaction do
            @task = Task.find(params[:id])
            task_params = params.require(:task)
                                .permit(:title, :member_id, :content)
            @task.update_attributes! task_params
        end
    rescue ActiveRecord::RecordInvalid
        render action: :edit
    end
end
