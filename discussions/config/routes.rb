# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :channels
    resources :discussions do
      resources :replies
    end

    root 'discussions#index'

    devise_for :users, controllers: { registrations: 'registrations' }
  end
end
