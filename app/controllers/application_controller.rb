class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	private

	def current_user
		@current_user ||= User.last
	end

end
