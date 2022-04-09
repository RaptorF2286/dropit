# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static_pages#index'

  get 'static_pages/index'
  get 'dashboard/index'
  devise_for :users

  resources :people
  resources :posts do
    resources :comments
  end
end
