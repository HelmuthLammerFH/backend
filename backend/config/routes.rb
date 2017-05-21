Rails.application.routes.draw do
  get 'welcome/index'

  resources :status
  resources :tours

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :status
      resources :tours
    end
  end
end
