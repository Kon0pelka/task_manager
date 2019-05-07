# frozen_string_literal: true

class Api::V1::UserController < ApplicationController
  def add_friend
    current_user.friends.create(friend: User.find_by_id(params[:id]))
    render status: :ok
  end

  def search_user
    render json: User.search(params[:friendly_id])
  end
end
