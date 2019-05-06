# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :tasks_director, class_name: 'Task', foreign_key: 'director_id', dependent: :destroy
  has_many :tasks_executor, class_name: 'Task', foreign_key: 'executor_id'
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  has_many :owner_groups, class_name: 'Group', foreign_key: 'owner_id', dependent: :destroy

  has_one_attached :image

  MAX_SIZE = 30_000_000

  validate  :correct_image_mime_type
  validate  :check_image_size
  validates :email,                     format: { with: URI::MailTo::EMAIL_REGEXP },
                                        presence: true
  validates :name,                      length: { maximum: 20 }, presence: true

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  def check_image_size
    errors.add :to_big_image, I18n.t('to_big_image') if image.attached? && image.blob.byte_size > MAX_SIZE
  end

  def correct_image_mime_type
    errors.add :wrong_format_image, I18n.t('wrong_format_image') if image.attached? && !image.content_type.in?(%w[image/png image/jpg image/jpeg])
  end
end
