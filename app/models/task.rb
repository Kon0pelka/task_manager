# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :executor, class_name: 'User', foreign_key: 'executor_id'
  belongs_to :director, class_name: 'User', foreign_key: 'director_id'
  belongs_to :group, optional: true

  has_one_attached :doc

  enum status: %i[set performed done]

  validates :title,                      length: { maximum: 50 }, presence: true

  # TODO: edit validation files and check it
end
