class AddFieldsToUserGroup < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :user_groups, :users
    add_foreign_key :user_groups, :groups
    add_index :user_groups, [:user_id, :group_id], unique: true
  end
end
