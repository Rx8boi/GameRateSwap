class RatingsController < ApplicationController

	def new
		if @game = Game.find_by_id(params[:game_id])
			@rating = @game.ratings.build
		else
			@rating = Rating.new
		end
	end

	def create

		@rating = current_user.ratings.build(rating_params)
		if @rating.save
			redirect_to rating_path(@rating)
		else
		render :new
		end
	end

	def show
		@rating = Rating.find_by_id(params[:id])
	end

	def index #checking for nested or not nested
		if @game = Game.find_by_id(params[:game_id])
			@ratings = @game.ratings
			#instead of using where statement to check valid game ID first
		else
			@ratings = Rating.all
		end
	end

	private

	def rating_params
		 params.require(:rating).permit(:game_id, :difficulty, :stars, :review)
	end
end