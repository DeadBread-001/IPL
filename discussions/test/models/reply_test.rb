# frozen_string_literal: true

require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  require 'test_helper'
  test 'не должен сохранятьcя комментарий пустой или с одним пустым полем' do
    assert ReplyTest.create(post: nil, text: 'test', author: 0).invalid?, '1'
    assert ReplyTest.create(post: 0,  text: nil, author: 0).invalid?, '2'
    assert ReplyTest.create(post: 0,  text: 'test', author: nil).invalid?, '3'
    assert ReplyTest.create(post: nil,  text: nil, author: 0).invalid?, '4'
    assert ReplyTest.create(post: nil,  text: 'test', author: nil).invalid?, '5'
    assert ReplyTest.create(post: 0, text: nil, author: nil).invalid?, '6'
    assert ReplyTest.create(post: nil,  text: nil, author: nil).invalid?, '7'
  end

  test 'должен сохранятьcя комментарий c заполненными полями' do
    assert ReplyTest.create(post: 0, text: 'test', author: 0).valid?
  end
end
