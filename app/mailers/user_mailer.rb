class UserMailer < ActionMailer::Base
  default from: "admin@plq.com"

  def notify_admin user
  	@user = user
  	mail(to: "Kerwin Alabi <kerwin@platformiv.com>", subject: 'New user just signed up!')
  end
end