require "administrate/base_dashboard"

class GroupDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user_groups: Field::HasMany,
    users: Field::HasMany,
    tasks: Field::HasMany,
    owner: Field::BelongsTo.with_options(class_name: "User"),
    id: Field::Number,
    title: Field::String,
    discription: Field::Text,
    owner_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user_groups,
    :users,
    :tasks,
    :owner,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user_groups,
    :users,
    :tasks,
    :owner,
    :id,
    :title,
    :discription,
    :owner_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user_groups,
    :users,
    :tasks,
    :owner,
    :title,
    :discription,
    :owner_id,
  ].freeze

  # Overwrite this method to customize how groups are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(group)
  #   "Group ##{group.id}"
  # end
end
