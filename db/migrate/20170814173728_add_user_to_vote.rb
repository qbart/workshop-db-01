class AddUserToVote < ActiveRecord::Migration[5.1]
  def up
    add_column :votes, :user_id, :integer, null: false
    add_foreign_key :votes, :users
    add_index :votes, :user_id
  end

  def down
    remove_column :votes, :user_id
  end
end
