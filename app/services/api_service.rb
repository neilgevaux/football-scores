# app/services/football_api_service.rb
class FootballApiService
  include HTTParty
  base_uri 'https://api-football.com'

  def initialize(api_key)
    @options = { headers: { 'X-RapidAPI-Key' => xxxx } }
  end

  def team_fixtures(team_id)
    response = self.class.get("/v3/fixtures", query: { team: team_id }, headers: @options[:headers])
    return response.parsed_response if response.success?
    raise "API request failed: #{response.code}"
  end
end
