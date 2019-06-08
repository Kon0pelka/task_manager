require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tasks_director: Field::HasMany.with_options(class_name: "Task"),
    tasks_executor: Field::HasMany.with_options(class_name: "Task"),
    user_groups: Field::HasMany,
    groups: Field::HasMany,
    owner_groups: Field::HasMany.with_options(class_name: "Group"),
    friends: Field::HasMany,
    friendly_users: Field::HasMany.with_options(class_name: "User"),
    image_attachment: Field::HasOne,
    image_blob: Field::HasOne,
    id: Field::Number,
    provider: Field::String,
    uid: Field::String,
    name: Field::String,
    nickname: Field::String,
    email: Field::String,
    created_at: Field::DateTime,
    friendly_id: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :nickname,
    :email,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :tasks_director,
    :tasks_executor,
    :user_groups,
    :groups,
    :owner_groups,
    :friends,
    :friendly_users,
    :image_attachment,
    :image_blob,
    :id,
    :provider,
    :uid,
    :name,
    :nickname,
    :email,
    :created_at,
    :friendly_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :tasks_director,
    :tasks_executor,
    :user_groups,
    :groups,
    :owner_groups,
    :friends,
    :friendly_users,
    :image_attachment,
    :image_blob,
    :provider,
    :uid,
    :name,
    :nickname,
    :email,
    :friendly_id,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
