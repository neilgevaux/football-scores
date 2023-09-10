# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  # Defines the root path route ("/")
  # root "articles#index"
  get 'football_data/show_team_statistics'

  get 'fixtures/fixtures'

  get 'fixtures/show'

  get 'fixtures/edit'

  get 'teams/show'

  get 'leagues/show'

  get 'venues/index'

  get 'api_predictions/show'
end
