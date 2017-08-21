class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title,          null: false
      t.date :released_at,      null: false
      t.integer :runtime,       null: false

      t.timestamps
    end
  end
end
