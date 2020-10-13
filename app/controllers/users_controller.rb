class UsersController < ApplicationController

#method for loading signup form
	def new
		@user = User.new
	end

#method to handle signup
	def create
		@user = User.new(user_params)
		if @user.save
		#login the user
		session[:user_id] = @user.user_id
		redirect_to games_path
		else
			render :signup
		end

	end

	private

	def user_params
		params.require(:user).permit(:email, :encrypted_password)
	end

end