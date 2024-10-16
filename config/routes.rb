Rails.application.routes.draw do
  
  get 'homes/top'
  root to: "homes#top"
  devise_for :users
  
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update]
  get 'homes/about' => 'homes#about',as: 'about'
end
