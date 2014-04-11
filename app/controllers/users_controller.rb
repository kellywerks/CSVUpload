class UsersController < ApplicationController

  def index
    @users = User.all
    render 'index'
  end

  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thanks for signing up!"
    else
      render 'new'
    end
  end

  private
  def user_params
    if current_user != nil
      if current_user.admin
        params.require(:user).permit(:admin, :email, :password, :password_confirmation)
      else
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
