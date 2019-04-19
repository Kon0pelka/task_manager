class Task < ApplicationRecord
  has_many :task_users
  belongs_to :user

  validates :title,                      length: { maximum: 50 }, presence: true
end
