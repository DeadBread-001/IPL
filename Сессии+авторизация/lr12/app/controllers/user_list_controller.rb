# frozen_string_literal: true

# class UserListController
class UserListController < ApplicationController
  def all
    @users = User.all
  end

  def you
    @user = current_user
  end
end
