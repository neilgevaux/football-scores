# frozen_string_literal: true

class AddVenueId < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :venue_id, :integer
  end
end
