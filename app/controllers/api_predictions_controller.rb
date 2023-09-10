# frozen_string_literal: true

class ApiPredictionsController < ApplicationController
  def show
    # require 'httparty'

    # url = URI("https://api-football-v1.p.rapidapi.com/v3/predictions?fixture=1035070")

    # response = HTTParty.get(url, headers: {
    #   "X-RapidAPI-Key" => ENV['API_KEY'],
    #   "X-RapidAPI-Host" => 'api-football-v1.p.rapidapi.com'
    # })

    # @prediction = JSON.parse(response.body)

    json_file_path = Rails.root.join('db', 'test_data.json')
    json_data = File.read(json_file_path)
    @prediction = JSON.parse(json_data)
  end
end
