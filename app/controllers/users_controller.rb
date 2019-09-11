class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      redirect_to user
      flash[:success] = "You account has been created"
    else
      render :new
    end
  end

  def index
    # @users = User.all
    # @users_search = User.where([':username LIKE :query OR :email LIKE :query', query: "%#{params[:users_search][:search]}%"])
    # @users_search = User.where(username: "%#{params[:users_search][:search]}%")
    if params[:search]
    @users = User.where('username LIKE :query OR email LIKE :query', query: "%#{params[:search]}%")
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :phone_num, :address,
                                 :age, :password, :password_confirmation)
  end
end
