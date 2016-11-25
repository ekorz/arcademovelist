Arcademovelist::Application.routes.draw do
  resources :games do
  	resources :characters
  end

  resources :characters do
  	resources :moves
  end

  root "games#index"
end
