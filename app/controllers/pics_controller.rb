class PicsController < ApplicationController
  before_action :require_sign_in

  before_action :authorize_user, only: [:destroy]

 def create
   @wiki = Wiki.find(params[:wiki_id])
   pic = @wiki.pics.new(pic_params)

   if pic.save
     flash[:notice] = "Image saved successfully."
     redirect_to [@wiki]
   else
     flash[:alert] = "Image failed to save."
     redirect_to [@wiki]
   end
 end

 def destroy
  @wiki = Wiki.find(params[:wiki_id])
  pic = @wiki.pics.find(params[:id])

  if pic.destroy
    flash[:notice] = "Image was deleted successfully."
    redirect_to [@wiki]
  else
    flash[:alert] = "Image couldn't be deleted. Try again."
    redirect_to [@wiki]
  end
end

private

 def pic_params
   params.require(:pic).permit(:caption, :image)
 end

 def authorize_user
 pic = Pic.find(params[:id])
 unless current_user == wiki.user || current_user.admin?
   flash[:alert] = "You do not have permission to delete a comment."
   redirect_to [wiki]
 end
end
end
