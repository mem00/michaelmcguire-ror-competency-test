Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "categories#index"

  resources :categories, only: [:index]
  
  namespace :admin do
    resources :users
  end

end
