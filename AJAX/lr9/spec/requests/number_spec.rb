# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Numbers', type: :request do
  # Тестируем корневой маршрут
  describe 'GET /' do
    before { get root_path } # перед каждым тестом делать запрос

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders input template' do
      expect(response).to render_template(:input)
    end

    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end

  # Тестируем маршрут вывода результата
  describe 'GET /result' do
    # Сценарий, когда параметры неправильные
    context 'when params are invalid' do
      before {  post result_path, xhr: true } # перед каждым тестом делать запрос (xhr: true - значит асинхронно, чтобы работал turbo)

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders result templates' do
        expect(response).to render_template(:result)
        expect(response).to render_template(:_result_message)
      end

      it 'responds with turbo stream' do
        expect(response.content_type).to match(%r{text/vnd.turbo-stream.html})
      end

      it 'assigns invalid model object' do
        expect(assigns(:numerator).valid?).to be false
      end
    end

    # Сценарий, когда парамаетры правильные
    context 'when params are ok' do
      # создаем случайные значения
      let(:n_param) { Faker::Number.number(digits: 3) }
      let(:a_param) { n_param.times.map{Faker::Number.number(digits: 3)}.to_a }

      # перед каждым тестом делать запрос (params - параметры запроса, xhr: true - выполнить асинхронно, чтобы работал turbo)
      before { post result_path, params: { n: n_param, a: a_param}, xhr: true }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders result templates' do
        expect(response).to render_template(:result)
        expect(response).to render_template(:_result_message)
      end

      it 'responds with turbo stream' do
        expect(response.content_type).to match(%r{text/vnd.turbo-stream.html})
      end
    end
  end
end