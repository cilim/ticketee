class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(:email)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    params = user_params.dup
    params[:password_confirmation] = params[:password]
    @user = User.new(params)
    if @user.save
      redirect_to admin_users_path, notice: "User is created successfully"
    else
      render 'new', alert: "User has not been created."
    end
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      redirect_to admin_users_path, notice: "User has been updated."
    else
      render action: "edit", alert: "User has not been updated."
    end
  end

  def destroy

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
