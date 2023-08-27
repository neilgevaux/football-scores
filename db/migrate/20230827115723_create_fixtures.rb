class CreateFixtures < ActiveRecord::Migration[7.0]
  def change
    create_table :fixtures do |t|
      t.integer :fixture_id
      t.string :referee
      t.string :timezone
      t.datetime :date
      t.integer :timestamp
      t.integer :first_period_start
      t.integer :second_period_start
      t.integer :venue_id
      t.string :status_long
      t.string :status_short
      t.integer :status_elapsed

      t.timestamps
    end
  end
end
