require "administrate/base_dashboard"

class TaskDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    executor: Field::BelongsTo.with_options(class_name: "User"),
    director: Field::BelongsTo.with_options(class_name: "User"),
    group: Field::BelongsTo,
    blob: Field::BelongsTo,
    title: Field::String,
    id: Field::Number,
    description: Field::Text,
    status: Field::String.with_options(searchable: false),
    doc: Field::ActiveStorage.with_options({destroy_path: :remove_attachment_admin_tasks_path}),
    to_remind: Field::Boolean,
    date_task: Field::DateTime,
    director_id: Field::Number,
    executor_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :executor,
    :director,
    :group
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :executor,
    :director,
    :group,
    :title,
    :description,
    :status,
    :to_remind,
    :date_task,
    :director_id,
    :executor_id,
    :doc
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :description,
    :status,
    :to_remind,
    :date_task,
    :executor,
    :director,
    :group,
    :doc
  ].freeze

  # Overwrite this method to customize how tasks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(task)
  #   "Task ##{task.id}"
  # end
end
