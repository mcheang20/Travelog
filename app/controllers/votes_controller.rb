class VotesController < ApplicationController

  before_action :require_sign_in

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @vote = current_user.votes.build(wiki: @wiki)

    if @vote.save
      @vote.update_attribute(:value, 1)
         Notification.create(recipient: @wiki.user, actor: current_user, action: "Liked", notifiable: @vote)
    else
      @vote = current_user.votes.create(value: 1, wiki: @wiki)
    end
    redirect_to :back
  end

  def destroy
      @wiki = Wiki.find(params[:wiki_id])
      @vote = current_user.votes.find(params[:id])

      if @vote.destroy
        @vote.update_attribute(:value, -1) unless @vote.destroyed?
      else
        @vote = current_user.votes.create(value: -1, wiki: @wiki)
      end
      redirect_to :back
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
