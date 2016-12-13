Arcademovelist::Application.routes.draw do
  resources :games
  resources :characters
  resources :moves
  resources :tabs
  resources :notes
  resources :setups
  resources :fatalities
  resources :builds
  
  root "games#index"
end
