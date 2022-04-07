# frozen_string_literal: true

Rails.application.routes.draw do
  get 'static_pages/index'
  get 'dashboard/index'
  devise_for :users
  root to: 'static_pages#index'

  resources :posts
end
