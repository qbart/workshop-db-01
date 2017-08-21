class CreateVotes < ActiveRecord::Migration[5.1]
  def up
    create_table :votes do |t|
      t.references :movie,   null: false, index: true, foreign_key: true
      t.integer :rating,     null: false

      t.timestamps
    end

    execute 'ALTER TABLE votes ADD CONSTRAINT check_rating_value CHECK (rating >= 1 AND rating <= 10)'
  end

  def down
    drop_table :votes
  end
end
