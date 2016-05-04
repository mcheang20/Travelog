class ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    false
  end

  def user_admin?
    user.has_role?('admin')
  end

  def user_standard?
    user.has_role?('standard')
  end

  def user_premium?
    user.has_role?('premium')
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?

  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, wiki.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
