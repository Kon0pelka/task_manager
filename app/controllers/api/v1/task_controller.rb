# frozen_string_literal: true

class Api::V1::TaskController < ApplicationController
  before_action :authenticate_user!
  def index
    current_user.tasks
  end

  def create
    current_user.tasks.create(task_params)
  end

  def show
    task
  end

  def update
    task
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
