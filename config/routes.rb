Arcademovelist::Application.routes.draw do
  resources :games
  resources :characters
  resources :moves
  
  root "games#index"
end
