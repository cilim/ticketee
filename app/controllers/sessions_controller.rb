class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(email: params[:signin][:email]).first

    if user && user.authenticate(params[:signin][:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "You have signed in successfully"
    else
      flash[:error] = "Sorry"
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to signin_path, notice: 'You have signed out successfully'
  end

end
