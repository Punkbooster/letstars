Rails.application.routes.draw do

  get 'home/index'

  devise_for :users

  root "home#index"

  resources :contests do
  	resources :musics do
      member do
        put "like", to: "musics#upvote"
      end
    end
  end

  resources :posts do
  	resources :comments
  end

  resources :profiles

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

end
