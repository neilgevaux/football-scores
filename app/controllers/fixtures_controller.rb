class FixturesController < ApplicationController
  def fixtures
    require 'httparty'

    url = URI("https://api-football-v1.p.rapidapi.com/v3/fixtures?league=39&season=2023")

    response = HTTParty.get(url, headers: {
      "X-RapidAPI-Key" => ENV['API_KEY'],
      "X-RapidAPI-Host" => 'api-football-v1.p.rapidapi.com'
    })

    @fixtures_data = JSON.parse(response.body)['response']

    @fixtures_data.each do |fixture_data|
      process_fixture(fixture_data)
    end
  end

  private

  def process_fixture(fixture_data)
    venue_data = fixture_data['fixture']['venue']
    league_data = fixture_data['league']
    home_team_data = fixture_data['teams']['home']
    away_team_data = fixture_data['teams']['away']
    goal_data = fixture_data['goals']
    score_data = fixture_data['score']

    venue = Venue.find_or_create_by(venue_data)
    league = League.find_or_create_by(league_data)
    home_team = Team.find_or_create_by(home_team_data)
    away_team = Team.find_or_create_by(away_team_data)

    fixture = Fixture.find_or_create_by(
      fixture_data['fixture'].merge(
        venue_id: venue.id,
        league_id: league.id,
        home_fixture_id: home_team.id,
        away_fixture_id: away_team.id
      )
    )

    Goal.find_or_create_by(fixture_id: fixture.id, **goal_data)
    Score.find_or_create_by(fixture_id: fixture.id, **score_data)
  end
end
