Rails.application.routes.draw do

  root   'static_pages#home'
  get    '/about',  to: 'static_pages#about'
  get    '/contact',  to: 'static_pages#contact'
  get    '/signup', to: 'users#new'
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  scope :app do
    resources :users
  end

  namespace :admin do
    root   'dashboards#index'
    get    'dashboard',  to: 'dashboards#dashboard'
    get    'seasons/get_seasons_by_league/:league_id', to: 'seasons#get_seasons_by_league'  


    resources :users
    resources :articles
    resources :clubs
    resources :players do
      resources :transfer_histories, only: [:create, :destroy]
    end
    resources :matches do
      resources :match_events
    end
    resources :leagues do
      resources :seasons
    end
  end

end
