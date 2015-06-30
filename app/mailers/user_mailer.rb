class UserMailer < ActionMailer::Base
  default from: "The PLQ <admin@theplq.com>"

  def notify_admin user
  	@user = user
  	mail(to: "Kerwin Alabi <ammarshah123@gmail.com>", subject: 'New user just signed up!')
  end

  def request_for_membership form_fields
  	@form_fields = form_fields
  	mail(to: "Kerwin Alabi <kerwin@platformiv.com>", subject: 'New membership request')
  end
end