class User < ActiveRecord::Base
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

  before_validation :set_name

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  has_many :identities, dependent: :destroy

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

  def connected_identites
    @connected_identities = Identity.find_by_user_id(self.id).select(:provider) || []
  end

  def unconnected_identities
    SmartSyncV25::Application::OMNIAUTH.keys.delete_if { |key, value| connected_identities.include?(key) }
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

  def split_name
    splited_name ||= self.name.split

    if splited_name.length == 2
      self.firstname = splitted_name.first
      self.lastname = splitted_name.lastname
    else
      self.lastname = splitted_name.slice!(-1)
      self.firstname = splitted_name.join(" ")
    end

  end

  def join_name
    self.name = "#{self.firstname} #{self.lastname}"
  end

  def set_name
    split_name if !self.name.nil? && self.firstname.nil? && self.lastname.nil?
    join_name if self.name.nil? && !self.firstname.nil? && !self.lastname.nil?
    
  end

end