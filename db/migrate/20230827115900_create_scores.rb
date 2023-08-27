class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.integer :score_id
      t.integer :fixture_id
      t.integer :halftime_home
      t.integer :halftime_away
      t.integer :fulltime_home
      t.integer :fulltime_away
      t.integer :extratime_home
      t.integer :extratime_away
      t.integer :penalty_home
      t.integer :penalty_away

      t.timestamps
    end
  end
end
