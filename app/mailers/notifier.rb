class Notifier < ActionMailer::Base
  default :from => "from@example.com"
  
  def invitation user
    @user = user
    mail to: user.email, subject: "An account has been created for you"
  end
end
