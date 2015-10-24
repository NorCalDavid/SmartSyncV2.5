class Github < ActiveRecord::Base
  
  belongs_to :user
  # belongs_to :identity, :foreign_key => 'uid', :primary_key => 'uid'

  def self.find_for_oauth(auth, user)
    github_user = find_or_create_by(uid: auth.uid, user_id: user.id)

    github_user.update_attributes( screen_name: auth.info.nickname,
							    								 location: auth.info.location,
							    								 image_url: auth.info.image,
							    								 profile_url: auth.info.urls["GitHub"],
							    								 personal_website_url: auth.info.urls["Blog"],
							    								 public_repos_count: auth.extra.raw_info["public_repos"],
							    								 public_repos_url: auth.extra.raw_info["repos_url"],
							    								 private_repos_count: auth.extra.raw_info["total_private_repos"],
							    								 public_gists_count: auth.extra.raw_info["public_gists"],
							    								 public_gists_url: auth.extra.raw_info["gists_url"],
							    								 private_gists_count: auth.extra.raw_info["private_gists"],
							    								 personal_private_repos_count: auth.extra.raw_info["owned_private_repos"],
							    								 total_data_stored: auth.extra.raw_info["disk_usage"],
							    								 followers_count: auth.extra.raw_info["followers"],
							    								 followers_url: auth.extra.raw_info["followers_url"],
							    								 following_count: auth.extra.raw_info["following"],
							    								 following_url: auth.extra.raw_info["following_url"],
							    								 starred_url: auth.extra.raw_info["starred_url"],
							    								 subscriptions_url: auth.extra.raw_info["subscriptions_url"],
							    								 organizations_url: auth.extra.raw_info["organizations_url"],
							    								 events_url: auth.extra.raw_info["events_url"] )
  end

end
