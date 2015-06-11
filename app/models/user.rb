class User < ActiveRecord::Base
  rolify
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  acts_as_taggable_on :interests
  

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  
  def self.cities
    ["Los Angeles", "Las Vegas", "Miami", "Toronto", "New York", "London", "Paris", "Stockholm", "Dubai"]
  end

  def self.services
    [
      "Restaurant Reservations", "Chauffer Services", "Interior Design",
      "Nightlife & Event Hosting", "Travel Coordination", "24/7 direct communication",
      "Accommodation Sourcing", "Fashion and style Consolation", "Global Lifestyle Management"
    ]
  end

  def self.tier
    ["PLQ Social", "PLQ Silver", "PLQ Gold", "PLQ Black"]
  end

end
