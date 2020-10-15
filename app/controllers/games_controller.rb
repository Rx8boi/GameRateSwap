class GamesController < ApplicationController
#This will prompt users to login before accessing anything
	#before_action :authenticate_user!
before_action :set_game, only: [:edit, :update]

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
		@games = Game.order_by_rating
	end

	def show
		@game = Game.find_by_id(params[:id])
	end

	def edit
		@game= Game.find_by_id(params[:id])
	end

	def update
		@game.update(game_params)
			redirect_to game_path
	end

	private

	def game_params
		params.require(:game).permit(:title, :description, :platform_id, platform_attributes: [:console])
	end

	def set_game
		@game = Game.find_by_id(params[:id])
	end

end