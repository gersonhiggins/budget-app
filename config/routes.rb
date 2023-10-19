Rails.application.routes.draw do
  devise_for :users

  root to: "users#index"
  
  resources :groups do
    resources :entities
  end
end
