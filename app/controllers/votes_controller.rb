class VotesController < ApplicationController

  before_action :require_sign_in

  def like_up
    update_vote(1)
    redirect_to :back
  end

  def like_down
      update_vote(-1)
      redirect_to :back
  end

private
def update_vote(new_value)
  @wiki = Wiki.find(params[:wiki_id])
  @vote = @wiki.votes.where(user_id: current_user.id).first

  if @vote
    @vote.update_attribute(:value, new_value)
  else
    @vote = current_user.votes.create(value: new_value, wiki: @wiki)
  end
end
end
