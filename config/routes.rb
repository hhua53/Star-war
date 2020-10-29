Rails.application.routes.draw do
  get 'about/index'
  resources :films
  resources :people
  resources :starships
  resources :planets
  resources :about
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
