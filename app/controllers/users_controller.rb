class UsersController < ApplicationController


  def show
    user = User.find_by(id: params[:id])

    if user
      render :show
    else
      flash[:messages] = ["User does not exist!"]
      redirect_to users_url
    end
  end

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_url(user)
    else
      flash.now[:messages] = ["User credentials invalid"]
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
