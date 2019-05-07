# frozen_string_literal: true

class Api::V1::Admin::TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: group.tasks
  end

  def create
    new_task = Task.new(task_params.merge(director: current_user, group: group))
    if new_task.save
      render json: new_task, status: :ok
    else
      render json: { errorsz: new_task.errors.full_messages }, status: 400
    end
  end

  def show
    render json: task, include: %w[tasks_executor tasks_director]
  end

  def update
    if task.update_attributes(task_params)
      render json: task, status: :ok
    else
      render json: { errors: task.errors.full_messages }, status: 400
    end
  end

  def destroy
    task.delete
    render status: :ok
  end

  private

  def task_params
    params.permit(:title, :description, :date_task, :to_remind, :status, :executor)
  end

  def task
    group.tasks.find_by_id(params[:id])
  end

  def group
    current_user.owner_groups.find_by_id(params[:group_id])
  end
end
