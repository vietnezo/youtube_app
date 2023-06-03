Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, controllers: { registrations: 'registrations' }
  scope :auth do
    get "is_signed_in", to: "auth#is_signed_in?"
  end

  resources :movies
  get '/share' => 'movies#new'

  root to: "home#index"
  mount ActionCable.server => '/cable'
end
