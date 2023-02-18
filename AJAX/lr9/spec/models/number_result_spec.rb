# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NumberResult, type: :model do
  # тестируем валидации
  describe 'validations' do
    # тестируем, что модель проверяет наличие параметров и выводит соответствующее сообщение
    it { should validate_presence_of(:n).with_message('Не может быть пустым') }
    it { should validate_presence_of(:a).with_message('Не может быть пустым') }

    # тестируем валидации, когда x и y не являются числами
    context 'when n are not digit' do
      it { should_not allow_value(Faker::Lorem.word).for(:n) }
    end

    # тестируем валидации, когда a не являются числами
    context 'when a are digits list' do
      it { should allow_value(Faker::Number.number).for(:a) }
    end
  end
end