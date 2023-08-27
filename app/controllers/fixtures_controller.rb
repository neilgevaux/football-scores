class FixturesController < ApplicationController
  def fixtures

    require 'httparty'

    url = URI("https://api-football-v1.p.rapidapi.com/v3/fixtures?league=39&season=2023")

    response = HTTParty.get(url, headers: {
      "X-RapidAPI-Key" => ENV['API_KEY'],
      "X-RapidAPI-Host" => 'api-football-v1.p.rapidapi.com'
    })

    @fixtures = JSON.parse(response.body)

  end
end

  