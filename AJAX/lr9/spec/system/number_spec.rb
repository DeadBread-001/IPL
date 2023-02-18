# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  # автоматически создаем значения x и y
  let(:n_param) { Faker::Number.number(digits: 3) }
  let(:a_param) { n_param.times.map{Faker::Number.number(digits: 3)}.to_a }

  # сценарий успешного складывания x + y
  scenario 'not empty calc' do
    visit root_path # переходим на страницы ввода

    fill_in :n, with: n_value # заполняем поле с name="x"
    fill_in :a, with: a_value # заполняем поле с name="y"

    find('#calculate-btn').click # нажимаем на кнопку с id="calculate_btn"

    # ожидаем найти в контенере вывода правильное содержимое
    # expect(find('#result-container')).to have_text("Полученный ответ: #{x_value + y_value}")
  end

  # сценарий неправильного ввода формы
  scenario 'do not fill any values in form and click submit' do
    visit root_path # переходим на страницу ввода

    find('#calculate-btn').click # нажимаем на кнопку с id="calculate_btn"

    # ожидаем найти в контенере вывода содержимое с выводом всех ошибок модели
    CalculatorResult.new.errors.messages.each do |message|
      expect(find('#result-container')).to have_text(message)
    end
  end
end