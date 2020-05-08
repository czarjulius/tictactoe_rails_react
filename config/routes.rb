# frozen_string_literal: true

Rails.application.routes.draw do
  resources :games
  root 'games#index'
  patch 'games/:id/move/:position', to: 'games#play_game'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
