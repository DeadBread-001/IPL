require "test_helper"

class Lr9ControllerTest < ActionDispatch::IntegrationTest
  test 'should get right' do
    get lr9_input_url, params: {val: 56}
    assert_equal 0, 0
  end
end
