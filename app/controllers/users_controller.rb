class UsersController < ApplicationController

#method for loading signup form
	def new
		@user = User.new
	end

#method to handle signup
	def create
	end

end