class CityPolicy
 attr_reader :user, :city

 def initialize(user, city)
  @user = user
  @city = city
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
