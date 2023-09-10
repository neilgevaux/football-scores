# frozen_string_literal: true

class LeaguesController < ApplicationController
  def show
    require 'httparty'

    url = URI('https://api-football-v1.p.rapidapi.com/v3/leagues?country=england')

    response = HTTParty.get(url, headers: {
                              'X-RapidAPI-Key' => ENV['API_KEY'],
                              'X-RapidAPI-Host' => 'api-football-v1.p.rapidapi.com'
                            })

    puts response.body

    @leagues = JSON.parse(response.body)
  end
end
