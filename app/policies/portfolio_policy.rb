class PortfolioPolicy
 attr_reader :user, :portfolio

 def initialize(user, portfolio)
  @user = user
  @portfolio = portfolio
 end

 def email_manager?
  user.admin? or user.ceo? or user.coordinator?
 end

 def edit?
  user.admin? or portfolio.user_id == user.id
 end

 def new?
  user.admin? or portfolio.user_id == user.id
 end

 def edit?
  user.admin? or portfolio.user_id == user.id
 end

 def update?
  user.admin? or portfolio.user_id == user.id
 end

 def create?
  user.admin? or portfolio.user_id == user.id
 end

 def destroy?
  user.admin? or portfolio.user_id == user.id
 end

 def review?
  user.admin? or user.manager?
 end

 def decision?
  user.admin? or user.manager?
 end

 def select?
  user.admin? or user.ceo? 
 end

 def unselect?
  user.admin? or user.ceo? 
 end

 def edit_multiple?
  user.admin? or user.ceo? 
 end

 def ongoing?
  user.admin? or user.ceo? 
 end

end
