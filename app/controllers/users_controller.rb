class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @wiki = current_user.wikis
     @vote = current_user.votes
   end

   def edit
     @user = User.find(params[:id])
   end

   def update
      @user = User.find(params[:id])

      if @user.update_attributes(user_params)
        flash[:notice] = "Wiki was updated successfully."
        redirect_to @user
      else
        flash.now[:alert] = "There was an error saving the wiki. Please try again."
      end
    end

   private

   def user_params
     params.require(:user).permit(:username, :description, :image)
   end
end
