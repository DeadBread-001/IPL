Rails.application.routes.draw do
  get 'user_list/all'
  get 'user_list/you'
  get 'calc/input'
  get 'calc/view'
  devise_for :users

  root to: 'calc#input'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
