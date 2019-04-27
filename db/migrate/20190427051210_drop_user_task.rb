class DropUserTask < ActiveRecord::Migration[5.2]
  def change
    drop_table :task_users
  end
end
