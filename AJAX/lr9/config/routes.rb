Rails.application.routes.draw do
  get 'lr9/input'
  get 'lr9/view'
  root 'lr9#input'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
