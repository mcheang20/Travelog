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
end
