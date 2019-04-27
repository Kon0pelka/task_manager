class AddFieldToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :director_id, :integer
    add_column :tasks, :executor_id, :integer
    add_foreign_key :tasks, :users, column: :director_id
    add_foreign_key :tasks, :users, column: :executor_id
  end
end
