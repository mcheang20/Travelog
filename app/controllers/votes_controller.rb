class VotesController < ApplicationController

  before_action :require_sign_in

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @vote = @wiki.votes.new(wiki: @wiki)
    @vote.user = current_user

    if @vote.save
        @vote.update_attribute(:value, 1)
      else
        Notification.create(recipient: @wiki.user , actor: current_user, action: "like", notifiable: @wiki )
        @vote = current_user.votes.create(value: 1, wiki: @wiki)
    end
      redirect_to wikis_path
  end

  def destroy
      @wiki = Wiki.find(params[:wiki_id])
      @vote = current_user.votes.find(params[:id])

      if @vote.destroy
        @vote.update_attribute(:value, -1) unless @vote.destroyed?
      else
        @vote = current_user.votes.create(value: -1, wiki: @wiki)
      end
      redirect_to wikis_path
  end

private

  def vote_params
    params.require(:vote).permit(:value)
  end
#private
#def update_vote(new_value)
#  @wiki = Wiki.find(params[:wiki_id])
#  @vote = current_user.votes.build(wiki: wiki)

#  if @vote.save
#    @vote.update_attribute(:value, new_value)
#  else
#    @vote = current_user.votes.create(value: new_value, wiki: @wiki)
#  end
#end
end
