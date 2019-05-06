# frozen_string_literal: true

class Api::V1::Admin::TasksController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   render json: { tasks_executor: current_user.tasks_executor,
  #                  tasks_director: current_user.tasks_director }
  # end

  # def create
  #   new_task = Task.new(task_params.merge(executor: current_user, director: current_user))
  #   if new_task.save
  #     render json: new_task, status: :ok
  #   else
  #     render json: { errorsz: new_task.errors.full_messages }, status: 400
  #   end
  # end

  # def show
  #   render json: task
  # end

  # def update
  #   if task.update_attributes(task_params)
  #     render json: task, status: :ok
  #   else
  #     render json: { errors: task.errors.full_messages }, status: 400
  #   end
  # end

  # def destroy
  #   task.delete
  #   render status: :ok
  # end

  # private

  # def task_params
  #   params.permit(:title, :description, :date_task, :to_remind, :status)
  # end

  # def task
  #   current_user.tasks_director.find_by_id(params[:id])
  # end
end
