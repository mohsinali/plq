class User < ActiveRecord::Base
  mount_uploader :image, ProfileImageUploader

  rolify
  # enum role: [:user, :vip, :admin]
  # after_initialize :set_default_role, :if => :new_record?
  acts_as_taggable_on :interests
  acts_as_messageable
  
  has_many :user_services, dependent: :destroy
  has_many :user_cities, dependent: :destroy
  has_and_belongs_to_many :languages

  # def set_default_role
  #   self.role ||= :user
  # end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def services
    self.user_services
  end

  def services_array
    self.user_services.map{|s| s.name }
  end

  def services_string
    self.user_services.map{|s| s.name }.join(", ")
  end
  
  ## Static Methods
  def self.cities
    ["Istanbul", "Los Angeles", "Las Vegas", "Miami", "Toronto", "New York", "London", "Stockholm", "Dubai"]
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

  def to_param
    [id, name.parameterize].join("-")
  end

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

  def approve_disapprove
    self.update_attribute(:approved, self.approved ^= true)
    if self.approved
      UserMailer.provider_approved(self).deliver
    end
  end
end
