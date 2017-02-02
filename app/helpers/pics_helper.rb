module PicsHelper
  def user_is_authorized_for_pic?
    current_user == nil? || current_user == @wiki.user 
 end
end
