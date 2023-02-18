# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'number#input'
  get 'number/input'
  post 'number/result'
  get 'number/get_xml_remotely'
  # Defines the root path route ("/")
end
