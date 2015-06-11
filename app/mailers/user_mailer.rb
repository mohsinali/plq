class UserMailer < ActionMailer::Base
  default from: "The PLQ <admin@theplq.com>"

  def notify_admin user
  	@user = user
  	mail(to: "Kerwin Alabi <kerwin@platformiv.com>", subject: 'New user just signed up!')
  end
end