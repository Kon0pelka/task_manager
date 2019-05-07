class AddFriendlyIdFromUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :friendly_id, :string, null: false
  end
end
