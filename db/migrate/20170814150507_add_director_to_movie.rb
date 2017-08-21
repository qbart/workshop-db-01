class AddDirectorToMovie < ActiveRecord::Migration[5.1]
  def up
    add_column :movies, :director_id, :integer, null: false
    add_foreign_key :movies, :directors
    add_index :movies, :director_id
  end

  def down
    remove_column :movies, :director_id
  end
end
