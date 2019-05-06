class RemoveForeingKeyGroupFromTask < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :tasks, :groups
  end
end
