module VotesHelper
  def liked_wiki?
    current_user.like_up
  end
end
