class UsersController < ApplicationController

#method for loading signup form
  def new
  	@game = Game.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render :new
    end
  end

  def index
    @ratings = Rating.all
    if user_signed_in?
    @user = User.find_by_id(params[:id])
    else
    	redirect_to '/'
    end
  end

  def show
  	@user = User.last
  	 redirect_to users_path
  	end

  private

  #def user_params
   # params.require(:user).permit(:username, :email, :password)
  #end

end