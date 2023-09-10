namespace :db do

task clear_and_populate_fixtures: :environment do
    # Clear the database
    Fixture.delete_all

  # Populate fixtures
  Rake::Task['db:populate_fixtures'].invoke
end

  desc "Populate fixtures table with JSON data"
  task populate_fixtures: :environment do
    require 'httparty'

    url = URI("https://api-football-v1.p.rapidapi.com/v3/fixtures?league=39&season=2023")

    response = HTTParty.get(url, headers: {
      "X-RapidAPI-Key" => ENV['API_KEY'],
      "X-RapidAPI-Host" => 'api-football-v1.p.rapidapi.com'
    })

    fixtures_data = JSON.parse(response.body)["response"]

    fixtures_data.each do |fixture_data|
      fixture_info = fixture_data["fixture"]
      league_info = fixture_data["league"]
      home_team_info = fixture_data["teams"]["home"]
      away_team_info = fixture_data["teams"]["away"]
      goals_info = fixture_data["goals"]
      score_info = fixture_data["score"]

      Fixture.create!(
        fixture_id: fixture_info["id"],
        referee: fixture_info["referee"],
        timezone: fixture_info["timezone"],
        date: fixture_info["date"],
        timestamp: fixture_info["timestamp"],
        venue_id: fixture_info["venue"]["id"],
        venue_name: fixture_info["venue"]["name"],
        venue_city: fixture_info["venue"]["city"],
        status_long: fixture_info["status"]["long"],
        status_short: fixture_info["status"]["short"],
        elapsed: fixture_info["status"]["elapsed"],
        league_id: league_info["id"],
        league_name: league_info["name"],
        league_country: league_info["country"],
        league_logo: league_info["logo"],
        league_flag: league_info["flag"],
        league_season: league_info["season"],
        league_round: league_info["round"],
        home_team_id: home_team_info["id"],
        home_team_name: home_team_info["name"],
        home_team_logo: home_team_info["logo"],
        home_team_winner: home_team_info["winner"],
        away_team_id: away_team_info["id"],
        away_team_name: away_team_info["name"],
        away_team_logo: away_team_info["logo"],
        away_team_winner: away_team_info["winner"],
        home_goals: goals_info["home"],
        away_goals: goals_info["away"],
        halftime_home: score_info["halftime"]["home"],
        halftime_away: score_info["halftime"]["away"],
        fulltime_home: score_info["fulltime"]["home"],
        fulltime_away: score_info["fulltime"]["away"],
        extratime_home: score_info["extratime"]["home"],
        extratime_away: score_info["extratime"]["away"],
        penalty_home: score_info["penalty"]["home"],
        penalty_away: score_info["penalty"]["away"]
      )
    end

    puts "Fixtures populated successfully!"
  end
end
