class UsersController < ApplicationController

before_action :require_sign_in

  def show
     @user = User.find(params[:id])
     @wiki = @user.wikis
     @vote = @user.votes
   end

   def edit
     @user = User.find(params[:id])
   end

   def update
      @user = User.find(params[:id])

      if @user.update_attributes(user_params)
        flash[:notice] = "Profile was updated successfully."
        redirect_to @user
      else
        flash.now[:alert] = "There was an error updating your profile. Please try again."
      end
    end

   private

   def user_params
     params.require(:user).permit(:username, :description, :image)
   end
end
