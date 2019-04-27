# frozen_string_literal: true

class Api::V1::TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    current_user.tasks
  end

  def create
    # binding.pry
    # new_task = Task.new(task_params.merdge(user: current_user))
    # if new_task.save
    #   render json: new_task, status: :ok
    # else
    #   render json: { errorsz: new_task.errors.full_messages }, status: 400
    # end
  end

  def show
    task
  end

  def update
    # if task.update_attributes(task_params)
    #   render json: task, status: :ok
    # else
    #   render json: { errors: task.errors.full_messages }, status: 400
    # end
  end

  def delete
    task.delete
  end

  private

  def task_params
    params.permit(:title, :description, :date, :to_remind, :status)
  end

  def task
    current_user.tasks.find(params[:id])
  end
end
