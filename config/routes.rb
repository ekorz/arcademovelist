Arcademovelist::Application.routes.draw do
  resources :games
  resources :characters do
    post :sort, on: :collection
  end
  resources :moves do
    post :sort, on: :collection
  end
  resources :tabs do
    post :sort, on: :collection
  end
  resources :notes do
    post :sort, on: :collection
  end
  resources :setups do
    post :sort, on: :collection
  end
  resources :fatalities do
    post :sort, on: :collection
  end
  resources :builds

  root "games#index"

end
