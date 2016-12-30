Arcademovelist::Application.routes.draw do
  resources :games do
    get :inline_update
  end
  resources :characters do
    post :sort, on: :collection
      get :inline_update
  end
  resources :moves do
    post :sort, on: :collection
      get :inline_update
  end
  resources :tabs do
    post :sort, on: :collection
  end
  resources :notes do
    post :sort, on: :collection
      get :inline_update
  end
  resources :setups do
    post :sort, on: :collection
      get :inline_update
  end
  resources :fatalities do
    post :sort, on: :collection
      get :inline_update
  end
  resources :builds

  root "games#index"

end
