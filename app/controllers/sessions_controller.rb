class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
      flash[:success] = "Enjoy your stay!"
    else
      redirect_to action: :new
      flash[:danger] = "Something went wrong along the way"
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
    flash[:primary] = "See ya"
  end
end
