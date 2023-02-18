# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Calcs', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get '/calc/input'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show_db' do
    it 'returns http success' do
      get '/calc/show_db'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /view' do
    it 'returns http success' do
      get '/calc/view'
      expect(response).to have_http_status(:success)
    end
  end
end
