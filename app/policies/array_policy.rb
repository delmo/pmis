class ArrayPolicy
 attr_reader :user, :selection

 def initialize(user, selection)
  @user = user
  @selection = selection
 end

 def general?
  user.manager? or user.admin? or user.ceo? 
 end

 def economic?
  user.manager? or user.admin? or user.ceo? 
 end

 def social?
  user.manager? or user.admin? or user.ceo? 
 end

 def other?
  user.manager? or user.admin? or user.ceo? 
 end
end
