# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :executor, class_name: 'User', foreign_key: 'executor_id'
  belongs_to :director, class_name: 'User', foreign_key: 'director_id'
  belongs_to :group, foreign_key: 'group_id'

  has_many_attached :docs

  validates :title,                      length: { maximum: 50 }, presence: true
end
