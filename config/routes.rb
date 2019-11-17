Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :movies
  get '/share' => 'movies#new'

  root to: "home#index"
end
