
class UsersController < ApplicationController

  def show
    @user = current_user
    @posts = Post.user(current_user)
    @user_profile = User.find(params[:id])
    @am_guest = Post.am_guest(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    p params
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to BeHere"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def edit
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age)
  end



end
