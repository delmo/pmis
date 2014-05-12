##############################
#
# Policy for  Task  records
#
##############################
class TaskPolicy
 attr_reader :user, :task

 def initialize(user, task)
  @user = user
  @task = task
 end

 def update?
  user.admin? or task.user_id == user.id
 end

 def destroy?
  user.admin? or task.user_id == user.id
 end

end
