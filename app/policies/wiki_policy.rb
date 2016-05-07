class WikiPolicy < ApplicationPolicy

  def user?
     user.present?
  end
end
