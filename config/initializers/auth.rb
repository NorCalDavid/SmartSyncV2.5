module Omniauth
	class Providers < Settingslogic
	  source "#{Rails.root}/config/omniauth.yml"
	  namespace Rails.env
	end
end