class LocationPolicy
 attr_reader :user, :location

 def initialize(user, location)
  @user = user
  @location = location
 end

 def new?
  user.admin? or user.manager?
 end

 def create?
  user.admin? or user.manager?
 end

 def edit?
  user.admin? or (location.user_id == user.id and user.manager?)
 end

 def update?
  user.admin? or (location.user_id == user.id and user.manager?)
 end

 def destroy?
  user.admin? or (location.user_id == user.id and user.manager?)
 end

end
