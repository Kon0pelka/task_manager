# frozen_string_literal: true

class Friend < ApplicationRecord
  belongs_to :friend
  belongs_to :user
end
