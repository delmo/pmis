##############################
#
# Policy for  Criteria records
#
##############################
class RankCriteriumPolicy
 attr_reader :user, :rank_criterium

 def initialize(user, rank_criterium)
  @user = user
  @rank_criterium = rank_criterium
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
