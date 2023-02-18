require 'json'
require 'selenium-webdriver'
require 'rspec'
include RSpec::Expectations

describe "Discussions" do

  before(:each) do
    @selen = Selenium::WebDriver.for :chrome
    @accept_next_alert = true
    @selen.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @selen.quit
    @verification_errors.should == []
  end

  it "uncorrect_password" do
    @selen.get "http://localhost:3000"
    @selen.find_element(:link, "Log In").click
    @selen.find_element(:id, "user_email").click
    @selen.find_element(:id, "user_email").send_keys 'someone@gmail.com'
    @selen.find_element(:id, "user_password").click
    @selen.find_element(:id, "user_password").send_keys '123456'
    @selen.find_element(:name, "commit").click
  end

  it 'test_correct_password' do
    @selen.get 'http://localhost:3000'
    @selen.find_element(:link, "Log In").click
    @selen.find_element(:id, "user_email").click
    @selen.find_element(:id, "user_email").send_keys 'someone@gmail.com'
    @selen.find_element(:id, "user_password").click
    @selen.find_element(:id, "user_password").send_keys '222222'
    @selen.find_element(:name, "commit").click
  end
  it 'test_log_out' do
    @selen.get 'http://localhost:3000'
    @selen.find_element(:link, "Log In").click
    @selen.find_element(:id, "user_email").click
    @selen.find_element(:id, "user_email").send_keys 'someone@gmail.com'
    @selen.find_element(:id, "user_password").click
    @selen.find_element(:id, "user_password").send_keys '222222'
    @selen.find_element(:name, "commit").click
    @selen.action.move_to(@selen.find_element(:link, "Account")).perform
    @selen.find_element(:link, "Log Out").click
  end
  it 'test_create_discussion' do
    @selen.get 'http://localhost:3000'
    @selen.find_element(:link, "Log In").click
    @selen.find_element(:id, "user_email").click
    @selen.find_element(:id, "user_email").send_keys 'someone@gmail.com'
    @selen.find_element(:id, "user_password").click
    @selen.find_element(:id, "user_password").send_keys '222222'
    @selen.find_element(:name, "commit").click
    @selen.find_element(:link,"New discussion").click
    @selen.find_element(:id, "discussion_title").click
    @selen.find_element(:id, "discussion_title").send_keys 'some title. HAHAHAHAHAHAHHAHAHAHAHAAH'
    @selen.find_element(:id, "discussion_content").click
    @selen.find_element(:id, "discussion_content").send_keys 'some text. HAHAHAHAHAHAHHAHAHAHAHAAHoaiufhoiauhvoidshvboidshboisfdoistruh i'
    element = @selen.find_element(:tag_name,"select")
    select = Selenium::WebDriver::Support::Select.new(element)
    select.select_by(:text, "AnotherChannel")
    @selen.find_element(:name, "commit").click
  end
  it 'test_delete_discussion' do
    @selen.get 'http://localhost:3000'
    @selen.find_element(:link, "Log In").click
    @selen.find_element(:id, "user_email").click
    @selen.find_element(:id, "user_email").send_keys 'someone@gmail.com'
    @selen.find_element(:id, "user_password").click
    @selen.find_element(:id, "user_password").send_keys '222222'
    @selen.find_element(:name, "commit").click
    @selen.find_element(:link_text, "Delete").click
    @selen.switch_to.alert.accept
    @selen.find_element(:link,"New discussion").click
  end
  it 'test_change_language' do
    @selen.get 'http://localhost:3000'
    @selen.find_element(:link, "Log In").click
    @selen.find_element(:id, "user_email").click
    @selen.find_element(:id, "user_email").send_keys 'someone@gmail.com'
    @selen.find_element(:id, "user_password").click
    @selen.find_element(:id, "user_password").send_keys '222222'
    @selen.find_element(:name, "commit").click
    @selen.action.move_to(@selen.find_element(:link_text, "Change language")).perform
    @selen.find_element(:id, "Russian").click
  end
  it 'test_regestration' do
    @selen.get 'http://localhost:3000'
    @selen.find_element(:link, "Sign Up").click
    @selen.find_element(:id, "user_username").click
    @selen.find_element(:id, "user_username").send_keys 'SomeHuman'
    @selen.find_element(:id, "user_email").click
    @selen.find_element(:id, "user_email").send_keys 'anotheremail@gmail.com'
    @selen.find_element(:id, "user_password").click
    @selen.find_element(:id, "user_password").send_keys '123321'
    @selen.find_element(:id, "user_password_confirmation").click
    @selen.find_element(:id, "user_password_confirmation").send_keys '123321'
    @selen.find_element(:name, "commit").click
  end
  it 'test_delete_account' do
    @selen.get 'http://localhost:3000'
    @selen.find_element(:link, "Log In").click
    @selen.find_element(:id, "user_email").click
    @selen.find_element(:id, "user_email").send_keys 'anotheremail@gmail.com'
    @selen.find_element(:id, "user_password").click
    @selen.find_element(:id, "user_password").send_keys '123321'
    @selen.find_element(:name, "commit").click
    @selen.action.move_to(@selen.find_element(:link, "Account")).perform
    @selen.find_element(:link, "SomeHuman").click
    @selen.find_element(:link, "Delete my account").click
    @selen.switch_to.alert.accept
  end
  def element_present?(how, what)
    $receiver.find_element(how, what)
    true
  rescue Selenium::Webselen::Error::NoSuchElementError
    false
  end

  def alert_present?()
    $receiver.switch_to.alert
    true
  rescue Selenium::Webselen::Error::NoAlertPresentError
    false
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end

  def close_alert_and_get_its_text(how, what)
    alert = $receiver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
