class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(session_params[:user_name], session_params[:password])
    if user
      log_in(user)
      flash[:messages] = ["Welcome back!"]
      redirect_to cats_url
    else
      flash.now[:messages] = ["Invalid credentials. Cannot log in."]
      render :new
    end
  end

  def new
    render :new
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:session).permit(:user_name, :password)
  end
end
