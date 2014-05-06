class InLinePolicy
 attr_reader :user, :in_line

 def initialize(user, in_line)
  @user = user
  @in_line = in_line
 end

 def new?
  !user.user? 
 end

 def create?
  !user.user? 
 end

 def edit?
  user.admin? or in_line.user_id == user.id or user.council? or user.coordinator? 
 end

 def update?
  user.admin? or in_line.user_id == user.id or user.council? or user.coordinator? 
 end

 def destroy?
  user.admin? or in_line.user_id == user.id or user.coordinator? 
 end

end
