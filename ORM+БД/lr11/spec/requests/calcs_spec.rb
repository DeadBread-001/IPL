# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe CalcHelper do
  include CalcHelper
  describe 'result of calculations' do
    it 'should get correct result' do
      expect(calc_automorf(1)).to eq([[0, "0"]])
      expect(calc_automorf(-100)).to eq([])
      expect(calc_automorf(0)).to eq([])
      expect(calc_automorf(100)).to eq([[0, "0"], [1, "1"], [3, "11"], [5, "101"], [7, "111"], [9, "1001"], [33, "100001"], [99, "1100011"]])
    end
  end
end
