class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Chuc mung ban #{user.name} dang nhap thanh cong"
      log_in user
      redirect_to user
    else
      flash[:danger] = "Dang nhap that bai"
      render 'sessions/new'
    end
  end

  def logout
    log_out
    redirect_to root_path
  end

end
