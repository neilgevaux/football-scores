# frozen_string_literal: true

class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end
end
