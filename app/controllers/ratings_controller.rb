class RatingsController < ApplicationController

	def new
		@game = Game.find_by_id(params[:game_id])
		@rating = @game.ratings.build
	end

	def create
		@rating = Rating.new(review_params)
		if @rating.save
			redirect_to rating_path(@rating)
		else
		render :new
		end
	end

	def show
	end

	def index
	end

	private

	def rating_params
		 params.require(:rating).permit(:game_id, :difficulty, :stars, :review)
	end
end