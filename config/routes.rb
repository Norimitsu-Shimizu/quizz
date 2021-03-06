Rails.application.routes.draw do
  devise_for :users
  root 'questions#top'
  resources :users, only: [:show]
  resources :questions, only: [:index, :new, :create, :show, :edit, :update] do
    collection do
      get 'ranking'
      get 'search'
      get 'how_to'
    end
    member do
      get 'genre'
    end
  end
  resources :answers, only: [:update]
end
