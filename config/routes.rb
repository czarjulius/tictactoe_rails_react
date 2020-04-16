Rails.application.routes.draw do
  resources :games
  root 'game#index'

  post 'opponent', to: 'game#opponent'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
