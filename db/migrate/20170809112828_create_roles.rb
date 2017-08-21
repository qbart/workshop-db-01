class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.references :actor,   null: false, index: true, foreign_key: true
      t.references :movie,   null: false, index: true, foreign_key: true
      t.string :name,        null: false

      t.timestamps
    end
  end
end
