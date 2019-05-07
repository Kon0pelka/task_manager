class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|

      t.timestamps
    end
    add_column :friends, :friend_id, :integer
    add_column :friends, :user_id, :integer
    add_foreign_key :friends, :users, column: :friend_id
    add_foreign_key :friends, :users, column: :user_id
  end
end
