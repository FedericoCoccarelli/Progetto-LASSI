class UsersController < ApplicationController

  def index
  	 @usrs = User.all
  end

  def show
    @usr = User.find(params[:id])
  end

  def new
  	@usr = User.new

  end

  def create
  	@usr = User.new(usr_params)

  	if @usr.save
      redirect_to @usr
    else
      render :new
    end
  end

 def edit
    @usr = User.find(params[:id])
  end

def destroy
    @usr = User.find(params[:id])
    @usr.destroy

    redirect_to root_path
  end

 def update
    @usr = User.find(params[:id])
    if @usr.update(usr_params)
      redirect_to @usr
    else
      render :edit
    end
  end
	
  private
    def usr_params
      params.require(:user).permit(:email,:coolness).with_defaults(coolness: 0)
    end




end
