class SectorPolicy
 attr_reader :user, :sector

 def initialize(user, sector)
  @user = user
  @sector = sector
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
