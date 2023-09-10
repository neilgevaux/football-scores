# frozen_string_literal: true

# lib/tasks/populate_venues.rake
namespace :db do
  desc 'Populate venues table with JSON data'
  task populate_venues: :environment do
    require 'httparty'

    url = URI('https://api-football-v1.p.rapidapi.com/v3/teams?country=england')

    response = HTTParty.get(url, headers: {
                              'X-RapidAPI-Key' => ENV['API_KEY'],
                              'X-RapidAPI-Host' => 'api-football-v1.p.rapidapi.com'
                            })

    venues_data = JSON.parse(response.body)['response']

    venues_data.each do |venue_data|
      team = Team.find_by(name: venue_data['team']['name'])
      Venue.create!(
        name: venue_data['venue']['name'],
        address: venue_data['venue']['address'],
        city: venue_data['venue']['city'],
        capacity: venue_data['venue']['capacity'],
        surface: venue_data['venue']['surface'],
        image: venue_data['venue']['image'],
        team_id: team.id
      )
    end

    puts 'Venues table populated!'
  end
end
