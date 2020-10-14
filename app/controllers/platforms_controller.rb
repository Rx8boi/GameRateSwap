class PlatformsController < ApplicationController
#This will prompt users to login before accessing anything
	#before_action :authenticate_user!

	def index
		@platforms = Platform.all
	end

end