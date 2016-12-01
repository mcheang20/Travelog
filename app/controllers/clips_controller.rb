class ClipsController < ApplicationController
  before_action :require_sign_in, except: [:show]

  before_action :authorize_user, only: [:destroy]

  def show
    @wiki = Wiki.find(params[:id])
    @clip = @wiki.clips.all
  end

 def create
   @wiki = Wiki.find(params[:wiki_id])
   @clip = @wiki.clips.new(clip_params)

   if @clip.save
     flash[:notice] = "Video uploaded successfully."
     redirect_to [@wiki]
   else
     flash[:alert] = "Video failed to save."
     redirect_to [@wiki]
   end
 end

 def destroy
  @wiki = Wiki.find(params[:wiki_id])
  @clip = @wiki.clips.find(params[:id])
  @clip.wiki = @wiki

  if @clip.destroy
    flash[:notice] = "Image was deleted successfully."
    redirect_to [@wiki]
  else
    flash[:alert] = "Image couldn't be deleted. Try again."
    redirect_to [@wiki]
  end
end

private

 def clip_params
   params.require(:clip).permit(:caption, :video)
 end

   def authorize_user
     clip = clip.find(params[:id])
   unless current_user == clip.wiki.user || current_user.admin?
     flash[:alert] = "You do not have permission to delete this image"
     redirect_to [clip.wiki]
   end
  end
end
