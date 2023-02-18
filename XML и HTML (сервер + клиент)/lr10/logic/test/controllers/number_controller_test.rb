# frozen_string_literal: true

require './test/test_helper'

Testing = [
  {
    input: { n: '30' },
    output: [[0, "0"], [1, "1"], [3, "11"], [5, "101"], [7, "111"], [9,"1001"]]
  },
  {
    input: { n: '3' },
    output: [[0, "0"], [1, "1"]]
  },
  {
    input: { n: '' },
    output: []
  },
  {
    input: { n: '-1' },
    output: []
  }
].freeze

# class NumberControllerTest
class NumberControllerTest < ActionDispatch::IntegrationTest
  test 'should return correct data' do
    Testing.each do |data|
      input = data[:input]
      output = data[:output]
      get "/number/calculate_list/?#{input.to_query}"
      assert_equal output, assigns(:result)
    end
  end
end
