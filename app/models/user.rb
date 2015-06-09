class User < ActiveRecord::Base
  rolify
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_create :notify_admin

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable


  private
    def notify_admin
      UserMailer.notify_admin(self).deliver
    end
end
