class User < ActiveRecord::Base
  attr_accessor :connected_social_logins, :available_social_logins, :connected_identites
  
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable

  devise :database_authenticatable, :registerable, :confirmable, 
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :properties, dependent: :destroy
  has_many :rooms, through: :properties, dependent: :destroy
  has_many :devices, through: :properties, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :event_logs, through: :events
  has_many :identities, dependent: :destroy

  before_validation :set_name

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update


  mount_uploader :image, ImageUploader


  def self.find_for_oauth(auth, signed_in_resource = nil)
    ap auth
    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(  name: auth.extra.raw_info.name,
                          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
                          password: Devise.friendly_token[0,20]
                        )

        user.skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end

    return user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def connected_identities
    @connected_identites = self.identities.select(:provider).collect{|object| object.provider } || []
  end

  def connected_social_logins
    return nil if connected_identities.nil?
    omniauth_providers = SmartSyncV25::Application::OMNIAUTH.values
    @connected_social_logins = omniauth_providers.select { |object| connected_identities.include?(object[:reference]) }
  end

  def available_social_logins
    omniauth_providers = SmartSyncV25::Application::OMNIAUTH.values
    @available_social_logins = omniauth_providers.delete_if { |object| connected_identities.include?(object[:reference]) }
  end

  def to_s
    "#{firstname} #{lastname}"
  end

  def image_thumbnail
    self.image ||= "http://res.cloudinary.com/hupgpadmb/image/upload/v1444201245/DefaultUsser.png"
  end

  def image_name
    return "User#{next_model_id}"
  end

  private

  def next_model_id
    ActiveRecord::Base.connection.execute("SELECT NEXTVAL('users_id_seq')").first["nextval"].to_i + 1
  end

  def join_name
    self.name = "#{self.firstname} #{self.lastname}"
  end

  def set_name
    join_name if self.name.nil? && !self.firstname.nil? && !self.lastname.nil?
    
  end

end