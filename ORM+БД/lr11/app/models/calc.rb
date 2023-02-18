# frozen_string_literal: true

# class Calc
class Calc < ApplicationRecord
  include CalcHelper
  attr_accessor :num, :flag

  validates :number, uniqueness: true
  self.primary_key = :number

  def result
    @num = number.to_i
    @flag = true
    if Calc.find_by_number(@num).nil?
      @ordinary_result = calc_automorf(@num).map { |number| number }
      @binary_result = calc_automorf(@num).map { |number| number }
      Calc.create!(number: @num, ordinary: @ordinary_result.to_json, binary: @binary_result.to_json)
    else
      calc = Calc.find_by_number(@num)
      @ordinary_result = JSON.parse(calc.ordinary)
      @binary_result = JSON.parse(calc.binary)
      @flag = false
    end
    Hash[@ordinary_result.zip @binary_result]
  end
end
