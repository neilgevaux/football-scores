class FixturesController < ApplicationController
  def fixtures

  #   require 'httparty'

  #   url = URI("https://api-football-v1.p.rapidapi.com/v3/fixtures?league=39&season=2023")

  #   response = HTTParty.get(url, headers: {
  #     "X-RapidAPI-Key" => ENV['API_KEY'],
  #     "X-RapidAPI-Host" => 'api-football-v1.p.rapidapi.com'
  #   })

  #   @fixtures = JSON.parse(response.body)

  end

  def show
    @fixtures = Fixture.all

    @fixture_date = Fixture.all.group_by { |fixture| fixture.date.to_date }
  end

  def edit
    @fixtures = Fixture.all

    @fixture_date = Fixture.all.group_by { |fixture| fixture.date.to_date }

    @date = Date.today
  end
end
