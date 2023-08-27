class Team < ApplicationRecord
  belongs_to :home_fixture, class_name: 'Fixture', foreign_key: 'home_fixture_id'
  belongs_to :away_fixture, class_name: 'Fixture', foreign_key: 'away_fixture_id'
end
