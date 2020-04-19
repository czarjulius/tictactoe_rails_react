Rails.application.routes.draw do
  resources :games
  root 'game#index'

  post 'new_game', to: 'game#new_game'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
