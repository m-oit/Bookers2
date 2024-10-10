Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about',as: 'about'
end
