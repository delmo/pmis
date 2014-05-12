##############################
#
# Policy for  monitoring PPA records
#
##############################
class MonitorPolicy
 attr_reader :user, :portfolio

 def initialize(user, portfolio)
  @user = user
  @portfolio = portfolio
 end
 
 def email_manager?
  user.admin? or user.ceo? or user.coordinator?
 end

end
