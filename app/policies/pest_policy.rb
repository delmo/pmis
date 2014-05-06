class PestPolicy
 attr_reader :user, :pest

 def initialize(user, pest)
  @user = user
  @pest = pest
 end

 def new?
  !user.user? 
 end

 def create?
  !user.user? 
 end

 def edit?
  user.admin? or pest.user_id == user.id or user.council? or user.coordinator? 
 end

 def update?
  user.admin? or pest.user_id == user.id or user.council? or user.coordinator? 
 end

 def destroy?
  user.admin? or pest.user_id == user.id or user.coordinator? 
 end

end
