class DropTable < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :task_users, :users
    remove_foreign_key :task_users, :tasks
    remove_index :task_users, [:user_id, :task_id]
    remove_foreign_key :tasks, :task_users
    remove_index :tasks, :task_user_id
    remove_column :tasks, :task_user_id
  end
end
