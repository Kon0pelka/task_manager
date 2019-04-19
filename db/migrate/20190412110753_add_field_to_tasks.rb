class AddFieldToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :title, :string, null: false, limit: 50
    add_column :tasks, :description, :text
    add_column :tasks, :status, :integer, default: 0
    add_column :tasks, :to_remind, :boolean, default: false
    add_column :tasks, :date_task, :datetime, null: false
    add_column :tasks, :task_user_id, :integer, null: false #Delete
    add_foreign_key :tasks, :task_users
    add_index :tasks, :task_user_id, unique: true   #Delete
  end
end
