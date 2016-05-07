class UsersController < ApplicationController
  def create
    @user = curent_user
  end

  def show
    @user = current_user
    @wiki = current_user.wikis
  end
end
