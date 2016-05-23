class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    #there could be no user with that email, if so, raise error and return
    #user is already a collaborator, raise error and return
    #user is self, raise error and return
    #user is not current collaborator, create collaborator, notice and return
    user = User.where(email: params[:email]).first

    if user.nil?
      flash[:error] = "No user with email: #{params[:email]}"
    elsif Collaborator.where(user: user, wiki: @wiki).first
      flash[:error] = "#{user.email} is already a collaborator"
    elsif current_user == user
      flash[:error] = "You can't add yourself"
    else
      if Collaborator.create!(user: user, wiki: @wiki)
        flash[:notice] = "Collaborator added"
      else
        flash[:error] = "Something went wrong. Try again."
      end
    end
    redirect_to edit_wiki_path(@wiki)
  end

  def destroy
    wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "Collaborator #{@collaborator.user.email} removed"
    else
      flash.now[:error] = "There was an error removing the collaborator"
    end
    redirect_to edit_wiki_path(wiki)
  end
end
