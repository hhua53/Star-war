Rails.application.routes.draw do
  root to: "home#index"
  resources :films do
    collection do
      get "search"
    end
  end
  resources :people
  resources :starships
  resources :planets
  resources :about

end
