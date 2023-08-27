class FootballDataController < ApplicationController
  def show_team_statistics

    require 'httparty'

    url = URI("https://api-football-v1.p.rapidapi.com/v3/teams/statistics?league=39&season=2023&team=59")

    response = HTTParty.get(url, headers: {
      "X-RapidAPI-Key" => ENV['API_KEY'],
      "X-RapidAPI-Host" => 'api-football-v1.p.rapidapi.com'
    })

    @api_response = JSON.parse(response.body)

  end
end
