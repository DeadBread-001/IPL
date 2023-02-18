# frozen_string_literal: true

# class CalcController
class CalcController < ApplicationController
  include CalcHelper
  before_action :authenticate_user!

  def authenticate_user!
    if user_signed_in?
      puts "User #{current_user} is authenticated"
    else
      puts "User isn't authenticated"
      redirect_to new_user_session_path
    end
  end

  def input; end

  def view
    @number = params['num'].to_i
    @result = calc_automorf(@number)
  end
end
