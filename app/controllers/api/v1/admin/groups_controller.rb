# frozen_string_literal: true

class Api::V1::Admin::GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.owner_groups
  end

  def create
    new_group = Group.new(group_params.merge(owner: current_user))
    if new_group.save
      new_group.user_groups.create(current_user)
      render json: new_group, status: :ok
    else
      render json: { errorsz: new_group.errors.full_messages }, status: 400
    end
  end

  def show
    render json: group, include: %w[users tasks]
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
    render status: :ok
  end

  private

  def group_params
    params.permit(:title, :discription)
  end

  def group
    current_user.owner_groups.find_by_id(params[:id])
  end
end
