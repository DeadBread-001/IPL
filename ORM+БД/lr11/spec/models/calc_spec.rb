# frozen_string_literal: true

require 'spec_helper.rb'
require 'rails_helper.rb'

RSpec.describe Calc, type: :model do
  include RSpec::Expectations
  describe 'Manipulating with model Calc' do
    it 'create Calc and check valid' do
      calc = Calc.create(number: 88)
      expect(calc).to be_valid
    end

    it 'create Calc and check invalid' do
      expect(Calc.create).to be_valid
    end

    it 'add new Calc and check count' do
      Calc.create(number: 88)
      Calc.create(number: 88)
      expect(Calc.count).to eq(1)
    end

    it 'create new Cals and save it' do
      expect(Calc.create.save).to be_truthy
    end

    it 'fill Calc with data and check it' do
      calc = Calc.create(number: 10, ordinary: '1 5 6', binary: '1 25 36')
      expect(calc).to have_attributes(number: 10, ordinary: '1 5 6', binary: '1 25 36')
    end

    it 'create new Calc and find it by number' do
      calc = Calc.create(number: 88)
      expect(Calc.find_by_number(calc.number)).to eq(calc)
    end

    it 'must be different' do
      calc = Calc.create(number: 24)
      calc = Calc.create(number: 25)
      expect(Calc.find_by_number(24) != Calc.find_by_number(25))
      expect(Calc.find_by_ordinary(24) != Calc.find_by_ordinary(25))
      expect(Calc.find_by_binary(24) != Calc.find_by_binary(25))
    end

    it 'try to add existing number' do
      Calc.create!(number: 1)
      expect(Calc.create(number: 1)).to be_invalid
    end

    it 'try to find not existing number' do
      expect(Calc.find_by_number(1)).to eq(nil)
    end
  end
end
