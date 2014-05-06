class ReportPolicy
 attr_reader :user, :report

 def initialize(user, report)
  @user = user
  @report = report
 end

 def new?
  user.admin? or user.manager? or user.coordinator?
 end

 def create?
  user.admin? or user.manager? or user.coordinator?
 end
 
 def edit?
  user.admin? or user.manager? or user.coordinator?
 end

 def update?
  user.admin? or user.manager? or user.coordinator?
 end

 def destroy?
  user.admin? or user.manager? or user.coordinator?
 end

end
