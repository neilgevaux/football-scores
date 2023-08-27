# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# db/seeds.rb

# db/seeds.rb

require 'httparty'

# API request
url = URI("https://api-football-v1.p.rapidapi.com/v3/teams?country=england")

response = HTTParty.get(url, headers: {
  "X-RapidAPI-Key" => ENV['API_KEY'],
  "X-RapidAPI-Host" => 'api-football-v1.p.rapidapi.com'
})

puts response.body

# Parse JSON response
teams_data = JSON.parse(response.body)['response']

# puts teams_data

# Seed the teams table
teams_data.each do |team_data|
  Team.find_or_create_by(
    name: team_data['team']['name'],
    code: team_data['team']['code'],
    country: team_data['team']['country'],
    founded: team_data['team']['founded'],
    national: team_data['team']['national'],
    logo: team_data['team']['logo'],
    team_id: team_data['team']['id']
  )
  # puts "Team #{team_data['team']['name']} seeded"
end
