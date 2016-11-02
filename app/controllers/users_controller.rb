class UsersController < ApplicationController
  def create
    @user = curent_user
  end

  def show
    @user = User.find(params[:id])
    @wiki = current_user.wikis
  end
end
