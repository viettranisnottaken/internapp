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
      @page = (params[:page] || 1).to_i
      @users = User.where('username LIKE :query OR email LIKE :query', query: "%#{params[:search]}%").offset(10 * (@page - 1)).limit(10)
      @total = User.where('username LIKE :query OR email LIKE :query', query: "%#{params[:search]}%").count
    else
      @page = (params[:page] || 1).to_i
      @users = User.offset(10 * (@page - 1)).limit(10)
      @per_page = @users.count
      @total = User.count
    end
  end

  # @page = (params[:page] || 0).to_i
  # @jobs = Job.offset(5 * @page).limit(5)
  # @per_page = @jobs.count

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :phone_num, :address,
                                 :age, :password, :password_confirmation)
  end
end
