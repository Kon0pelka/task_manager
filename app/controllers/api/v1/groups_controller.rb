# frozen_string_literal: true

class Api::V1::GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: current_user.groups
  end

  def create
    new_group = Group.new(group_params.merge(owner: current_user))
    if new_group.save
      render json: new_group, status: :ok
    else
      render json: { errorsz: new_group.errors.full_messages }, status: 400
    end
  end

  def show
    task
  end

  def update
    if group.update_attributes(group_params)
      render json: group, status: :ok
    else
      render json: { errors: group.errors.full_messages }, status: 400
    end
  end

  def destroy
    group.delete
  end

  private

  def group_params
    params.permit(:title, :description)
  end

  def group
    current_user.owner_groups.find(params[:id])
  end
end
