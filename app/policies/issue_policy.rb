class IssuePolicy
 attr_reader :user, :issue

 def initialize(user, issue)
  @user = user
  @issue = issue
 end

 def new?
  user.admin? or user.user? or user.coordinator? or user.manager? or user.ceo?
 end

 def create?
  user.admin? or user.user? or user.coordinator? or user.manager? or user.ceo?
 end

 def edit?
  user.admin? or user.user? or user.coordinator? or user.manager? or user.ceo?
 end

 def update?
  user.admin? or user.user? or user.coordinator? or user.manager? or user.ceo?
 end

 def destroy?
  user.admin? or user.user? or user.coordinator? or user.manager? or user.ceo?
 end


end
