class SiteController < ApplicationController
	layout 'site'

	def pundit_user
		current_admin
		# current_user to pundit (sobreescreveu o dafault,  current_user)
	end
end
