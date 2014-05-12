# Mailer controller
#
class ReportMailer < ActionMailer::Base
  default from: "donotreply.pmis@gmail.com"

  def project_notification(user, ppa, url)
   @user = user
   @ppa = ppa
   @url = url 
   mail(to: @user.email, subject: "#{@ppa.title}")
  end
end
