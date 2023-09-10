# frozen_string_literal: true

namespace :db do
  desc 'Fetch and parse JSON data'
  task fetch_fixtures: :environment do
    require 'httparty'

    url = URI('https://api-football-v1.p.rapidapi.com/v3/fixtures?league=39&season=2023')

    response = HTTParty.get(url, headers: {
                              'X-RapidAPI-Key' => ENV['API_KEY'],
                              'X-RapidAPI-Host' => 'api-football-v1.p.rapidapi.com'
                            })

    fixtures_data = JSON.parse(response.body)['response']
    puts fixtures_data.inspect
  end
end

# If you run the rake task daily, it will repopulate the tables with new data each time it runs. If you want to avoid conflicts with existing data, you can consider using a combination of methods such as:

# Clearing Existing Data: Before repopulating the tables, you can clear out the existing data to ensure a fresh start. You can do this by running a deletion command at the beginning of your rake task.

# Updating Existing Records: If you want to update existing records instead of deleting and recreating them, you can modify your rake task to check if a record with a particular identifier (e.g., fixture_id) already exists in the database. If it does, you can update the record with the new data. If it doesn't exist, you can create a new record.

# Here's an example of how you could modify your rake task to update existing records:

# namespace :db do
#   desc "Populate fixtures table with JSON data"
#   task populate_fixtures: :environment do
#     # Fetch and parse JSON data as before

#     fixtures_data.each do |fixture_data|
#       existing_fixture = Fixture.find_by(fixture_id: fixture_data["fixture"]["id"])

#       if existing_fixture
#         existing_fixture.update!(
#           # Update attributes here with new data
#         )
#       else
#         Fixture.create!(
#           # Create new fixture record
#         )
#       end
#     end

#     puts "Fixtures populated successfully!"
#   end
# end
