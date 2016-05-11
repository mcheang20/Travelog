class WikiPolicy < ApplicationPolicy

  def show?
     record.public || (user.admin? || user.premium? || record.user == user)
  end

  def user?
     user.present?
  end
end
