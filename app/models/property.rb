class Property < ActiveRecord::Base

  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many :devices, dependent: :destroy

  validates :name, :presence => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zipcode, :presence => true
  before_save :default_thumbnail

  mount_uploader :image, ImageUploader

  def default_thumbnail
    self.image ||= "http://res.cloudinary.com/hupgpadmb/image/upload/v1444201245/DefaultProperty.png"
  end

  def image_name
    return "Property#{next_model_id}"
  end

  def user_id
    return self.user.id
  end

  private

  def next_model_id
    ActiveRecord::Base.connection.execute("SELECT NEXTVAL('properties_id_seq')").first["nextval"].to_i + 1
  end



end
