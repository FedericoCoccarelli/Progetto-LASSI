class UsersController < ApplicationController
  def index
    authorize! :index, User, message: "You are not authorized!"
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    authorize! :create, User, message: "You are not authorized!"
      @user = User.find(params[:id])
      if current_user.email!=@user.email && current_user.coolness>@user.coolness
        if @user.update(user_params)
          redirect_to users_path
        end
      else
        render :edit
      end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def destroy
    authorize! :destroy, User, message: "You are not authorized!"
    @user = User.find(params[:id])
      if current_user.email!=@user.email && current_user.coolness>2
        @user.destroy
      end

      redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:coolness)
  end

end
