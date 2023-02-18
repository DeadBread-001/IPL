# frozen_string_literal: true

Rails.application.routes.draw do
  get 'calc/input', as: :calc_input
  get 'calc/view', as: :calc_view
  get 'calc/show_db'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'calc#input', as: :input
  # Defines the root path route ("/")
end
