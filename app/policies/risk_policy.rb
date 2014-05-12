##############################
#
# Policy for  Risk records
#
##############################
class RiskPolicy
 attr_reader :user, :risk

 def initialize(user, risk)
  @user = user
  @risk = risk
 end

 def new?
  !user.user? 
 end

 def create?
  !user.user? 
 end

 def edit?
  user.admin? or risk.user_id == user.id or user.council? or user.coordinator? 
 end

 def update?
  user.admin? or risk.user_id == user.id or user.council? or user.coordinator? 
 end

 def destroy?
  user.admin? or risk.user_id == user.id or user.coordinator? 
 end

end
