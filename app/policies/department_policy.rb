class DepartmentPolicy
 attr_reader :user, :department

 def initialize(user, department)
  @user = user
  @department = department
 end

 def new?
  user.admin?
 end

 def create?
  user.admin?
 end

 def edit?
  user.admin?
 end

 def update?
  user.admin?
 end

 def destroy?
  user.admin?
 end


end
