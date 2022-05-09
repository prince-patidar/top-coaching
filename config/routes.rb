# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'profiles#show'

  resources :profiles

  resources :grade_materials

  get 'download', to: 'grade_materials#download'

  resources :students, only: [:index]

  resources :teachers, only: [:index]

  resources :notifications, expect: [:edit, :update]

  resources :notification_recipient_copies, only: [:show, :destroy]
end
