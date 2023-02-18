# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'number#calculate_list'
  get 'number/calculate_list'
  # Defines the root path route ("/")
end