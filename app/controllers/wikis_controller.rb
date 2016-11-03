class WikisController < ApplicationController

  before_action :authorize_user, only: [:destroy, :edit, :update]
  def index
    @wikis =  policy_scope(Wiki)
  end

  def show
     @wiki = Wiki.find(params[:id])
     authorize @wiki
     unless @wiki.public || current_user
      flash[:alert] = "You must be signed in to view private wikis."
      redirect_to root_path

     authorize @wiki
    end
  end

  def new
    @wiki = Wiki.new
    @categories = Category.all.map{|c| [c.name, c.id] }
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)
    @wiki.category_id = params[:category_id]

    if @wiki.save
      flash[:notice] = "Wiki was saved successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end


  def edit
    @wiki = Wiki.find(params[:id])
    @categories = Category.all.map{|c| [c.name, c.id ] }
  end

  def update
     @wiki = Wiki.find(params[:id])
     @wiki.category_id = params[:category_id]

     if @wiki.update_attributes(wiki_params)
       flash[:notice] = "Wiki was updated successfully."
       redirect_to @wiki
     else
       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :edit
     end
   end

   def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :description, :image, :category_id, :public)
  end

  def authorize_user
    wiki = Wiki.find(params[:id])
  unless current_user == wiki.user || current_user.admin?
    flash[:alert] = "You do not have acesss to do that"
    redirect_to root_path
  end
 end
end
