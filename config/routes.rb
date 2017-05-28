Rails.application.routes.draw do
  resources :customer_in_tours
  resources :ressource_for_tours
  resources :ressource_typs
  resources :tour_to_positions
  resources :tour_positions
  resources :tours
  resources :statuses
  resources :tour_guides
  resources :customers
  resources :agencies
  resources :users
  resources :customer_in_tours
  resources :ressource_for_tours
  resources :ressource_typs
  resources :tour_to_positions
  resources :tour_positions
  resources :tours
  resources :statuses
  resources :tour_guides
  resources :customers
  resources :agencies
  resources :users
  resources :tour_guide_to_agenturs
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :customer_in_tours
      resources :ressource_for_tours
      resources :ressource_typs
      resources :tour_to_positions
      resources :tour_positions
      resources :tours
      resources :statuses
      resources :tour_guides
      resources :customers
      resources :agencies
      resources :users
      resources :tour_guide_to_agenturs
    end
  end

  scope "/api/v2" do
    resources :ressource_for_tours
  end
end
