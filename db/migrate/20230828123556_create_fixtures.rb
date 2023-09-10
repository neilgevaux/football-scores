# frozen_string_literal: true

class CreateFixtures < ActiveRecord::Migration[7.0]
  def change
    create_table :fixtures do |t|
      t.integer :fixture_id
      t.string :referee
      t.string :timezone
      t.datetime :date
      t.integer :timestamp
      t.integer :venue_id
      t.string :venue_name
      t.string :venue_city
      t.string :status_long
      t.string :status_short
      t.integer :elapsed
      t.integer :league_id
      t.string :league_name
      t.string :league_country
      t.string :league_logo
      t.string :league_flag
      t.integer :league_season
      t.string :league_round
      t.integer :home_team_id
      t.string :home_team_name
      t.string :home_team_logo
      t.boolean :home_team_winner
      t.integer :away_team_id
      t.string :away_team_name
      t.string :away_team_logo
      t.boolean :away_team_winner
      t.integer :home_goals
      t.integer :away_goals
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
