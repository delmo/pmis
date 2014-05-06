class SelectionPolicy
 attr_reader :user, :selection

 def initialize(user, selection)
  @user = user
  @selection = selection
 end

 def select?
  user.admin? or user.ceo? 
 end

 def unselect?
  user.admin? or user.ceo? 
 end
end
