class AddForeingKeyToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :group_id, :integer
    add_foreign_key :tasks, :groups, column: :group_id
  end
end
