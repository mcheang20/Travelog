module PicsHelper
  def user_is_authorized_for_pic?(pic)
    current_user && (current_user == pic.wiki.user || current_user.admin?)
 end
end
