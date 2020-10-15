class GamesController < ApplicationController
#This will prompt users to login before accessing anything
	#before_action :authenticate_user!

	def new
		@game = Game.new
		@game.build_platform
	end

	def create
		@game = Game.new(game_params)
		@game.user_id = User.last.id
		if @game.save
			redirect_to game_path(@game)
		else
			
			render :new
		end
	end

	def index
		@game = Game.last
		@games = Game.all
	end

	def show
		@game = Game.find_by_id(params[:id])
	end

	private

	def game_params
		params.require(:game).permit(:title, :description, :platform_id, platform_attributes: [:console])
	end


end