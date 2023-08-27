class Fixture < ApplicationRecord
  belongs_to :venue
  belongs_to :league
  has_one :home_team, class_name: 'Team', foreign_key: 'home_fixture_id'
  has_one :away_team, class_name: 'Team', foreign_key: 'away_fixture_id'
  has_one :goal
  has_one :score
end
