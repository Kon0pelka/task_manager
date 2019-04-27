class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :title, null:false, limit: 50
      t.text :discription
      t.integer :owner_id, null:false

      t.timestamps
    end
    add_foreign_key :groups, :users, column: :owner_id
  end
end
