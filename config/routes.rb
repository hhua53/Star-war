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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
