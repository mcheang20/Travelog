module UsersHelper
  def user_is_authorized?
    current_user == @user
  end

  def user_votes_nil?
    @user.votes.count == 0
  end

  def user_posts_nil?
    @user.wikis.count == 0
  end

  def current_user_is_following(current_user_id, followed_user_id)
    relationship = Follow.find_by(follower_id: current_user_id, following_id: followed_user_id)
    return true if relationship
  end
end
