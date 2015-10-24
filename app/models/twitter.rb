class Twitter < ActiveRecord::Base
  
  belongs_to :user
  # belongs_to :identity, :foreign_key => 'uid', :primary_key => 'uid'

  def self.find_for_oauth(auth, user)
    twitter_user = find_or_create_by(uid: auth.uid, user_id: user.id)

    twitter_user.update_attributes( screen_name: auth.info.nickname,
							    									location: auth.info.location,
							    									image_url: auth.info.image,
							    									profile_url: auth.info.urls["Twitter"] )
  end

end
