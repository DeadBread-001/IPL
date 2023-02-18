# frozen_string_literal: true

require 'test_helper'

class DiscussionTest < ActiveSupport::TestCase
  test 'не должен сохранятьcя пост пустой или с одним пустым полем' do
    assert DiscussionTest.create(title: nil, content: 'tt', author: 0).invalid?, '1'
    assert DiscussionTest.create(title: 'tt',   content: nil, author: 0).invalid?, '2'
    assert DiscussionTest.create(title: 'tt',   content: 'tt', author: nil).invalid?, '3'
    assert DiscussionTest.create(title: nil,   content: nil, author: 0).invalid?, '4'
    assert DiscussionTest.create(title: nil,   content: 'tt', author: nil).invalid?, '5'
    assert DiscussionTest.create(title: 'tt', content: nil, author: nil).invalid?, '6'
    assert DiscussionTest.create(title: nil, content: nil, author: nil).invalid?, '7'
  end

  test 'должен сохранятьcя пост c заполненными полями' do
    assert DiscussionTest.create(title: 'tt', content: 'tt', author: 0).valid?
  end
end
