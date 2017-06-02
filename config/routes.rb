Rails.application.routes.draw do
  resources :customer_in_tours
  resources :ressource_for_tours
  resources :tour_to_positions
  resources :tourpositions
  resources :tours
  resources :statuses
  resources :tourguides
  resources :customers
  resources :agencies
  resources :users
  get 'login/index'

  resources :customer_in_tours
  resources :ressource_for_tours
  resources :ressource_typs
  resources :tour_to_positions
  resources :tourpositions
  resources :tours
  resources :statuses
  resources :tourguides
  resources :customers
  resources :agencies
  resources :users
  resources :customer_in_tours
  resources :ressource_for_tours
  resources :ressource_typs
  resources :tour_to_positions
  resources :tourpositions
  resources :tours
  resources :statuses
  resources :tourguides
  resources :customers
  resources :agencies
  resources :users
  resources :tour_guide_to_agenturs
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'login/index'
      resources :customer_in_tours
      resources :ressource_for_tours
      resources :ressource_typs
      resources :tour_to_positions
      resources :tourpositions
      resources :tours
      resources :statuses
      resources :tourguides
      resources :customers
      resources :agencies
      resources :users
      resources :tour_guide_to_agenturs
    end
  end
end
