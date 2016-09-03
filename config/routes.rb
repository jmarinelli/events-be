Rails.application.routes.draw do
  resources :countries
  resources :states
  resources :activities
  resources :categories
  resources :users
  resources :events
  resources :cities

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
