class GamesController < ApplicationController
#This will prompt users to login before accessing anything
	#before_action :authenticate_user!

	def new
		@game = Game.new
		@game.build_platform
	end

	def create
		@game = Game.new(game_params)
		@game.user_id = session[:id]
		if @game.save
			redirect_to game_path(@game)
		else
			render :new
		end
	end


	private

	def game_params
		params.require(:game).permit(:title, :description, :platform_id, platform_attributes: [:console])
	end


end