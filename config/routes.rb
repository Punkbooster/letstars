Rails.application.routes.draw do
  devise_for :users
  root "contests#index"
  resources :contests
  resources :posts do
  	resources :comments
  end
end
