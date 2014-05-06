class RelationPolicy
 attr_reader :user, :relation

 def initialize(user, relation)
  @user = user
  @relation = relation
 end

 def new?
  !user.user? 
 end

 def create?
  !user.user? 
 end

 def edit?
  user.admin? or relation.user_id == user.id or user.council? or user.coordinator? 
 end

 def update?
  user.admin? or relation.user_id == user.id or user.council? or user.coordinator? 
 end

 def destroy?
  user.admin? or relation.user_id == user.id or user.coordinator? 
 end

end
