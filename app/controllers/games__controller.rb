class GamesController < ApplicationController
#This will prompt users to login before accessing anything
	before_action :authenticate_user!
end