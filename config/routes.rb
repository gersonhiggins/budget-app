Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy', as: :logout
  end
  
  root to: "users#index"
  
  resources :groups do
    resources :entities
  end
end
