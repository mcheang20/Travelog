module PicsHelper
  def user_is_authorized_for_pic?
    current_user == @wiki.user || current_user.admin?
 end
end
