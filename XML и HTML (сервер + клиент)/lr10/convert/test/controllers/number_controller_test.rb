# frozen_string_literal: true

require 'test_helper'

# class NumberControllerTest
class NumberControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get number_input_url
    assert_response :success
  end

  test 'should render html' do
    post '/number/result', params: { n: 100.to_s, format: 'html' }
    res1 = @response
    post '/number/result', params: { n: 10.to_s, format: 'html' }
    res2 = @response.body
    assert_not_equal(res1, res2)
  end

  test 'should get xml' do
    post '/number/result', params: { n: '1000' }
    assert_equal @response.class, ActionDispatch::TestResponse
  end
end
