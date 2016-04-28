class UsersController < ApplicationController
  def create
    @user = curent_user
  end
end
