# User controller
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def list
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # respond_to do |format|
      #   format.html { redirect_to root_path }
      flash[:success] = "Welcome to sample App!"
      log_in user
      redirect_to @user
    else
      # respond_to do |format|
      #   format.html {redirect_to users_new_path}
      # end
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
