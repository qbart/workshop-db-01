Rails.application.routes.draw do
  root to: 'dashboard#show'

  resources :actors, only: [] do
    collection do
      get :big_movies
    end
  end

  resources :movies, only: [:index, :show] do
    collection do
      get :high_rated
      get :letters
      get :popular
    end
  end

  resources :directors, only: [:index] do
    collection do
      get :actors
    end
  end

  resources :memo, only: [:index]
end
