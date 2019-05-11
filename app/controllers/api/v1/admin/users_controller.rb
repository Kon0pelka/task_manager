# frozen_string_literal: true

class Api::V1::Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: group.users
  end

  def show
    render json: group.users.find_by_id(params[:id])
  end

  def show_friend
    render json: current_user.friends
  end

  def add_user
    if current_user.friends.find_by_id(params[:id])
      group.user_groups.create(current_user.friends.find_by_id(params[:id]))
      render status: :ok
    else
      render status: :bad_request
    end
  end

  def remove_user
    if user_present?
      group.user_groups.delete(User.find_by_id(params[:id]))
      render status: :ok
    else
      render status: :bad_request
    end
  end

  private

  def group
    current_user.owner_groups.find_by_id(params[:group_id])
  end

  def user_present?
    !group.users.find_by_id(params[:id]).nil? &&
      group.users.find_by_id(params[:id]) != current_user
  end
end
