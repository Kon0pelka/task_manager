# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :users, through: :user_groups
  has_many :user_groups, dependent: :destroy
  has_many :tasks, dependent: :destroy
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  has_one_attached :image

  validates :title,                      length: { maximum: 50 }, presence: true
  validates :owner_id,                   presence: true
end
