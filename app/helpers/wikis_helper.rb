module WikisHelper
  def user_is_authorized_for_wiki?(wiki)
    current_user && (current_user == wiki.user || current_user.admin?)
 end

 def show_followed?
   if @user == current_user
     @wikis = Wiki.followed_users(current_user.following).order('created_at DESC')
   end
 end
end
