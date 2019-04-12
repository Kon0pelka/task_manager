class AddFieldToTaskUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :task_users, :user_id, :integer
    add_column :task_users, :task_id, :integer
    add_foreign_key :task_users, :users
    add_foreign_key :task_users, :tasks
    add_index :task_users, [:user_id, :task_id], unique: true
  end
end
