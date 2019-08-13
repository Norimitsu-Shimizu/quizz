Rails.application.routes.draw do
  devise_for :users
  root 'questions#top'
  resources :users, only: [:show]
  resources :questions, only: [:index, :new, :create, :show, :update]
  resources :answers, only: [:update]
end
