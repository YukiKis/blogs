class Public::SessionsController < ApplicationController
  def new
    if session[:user]
      redirect_to user_path(session[:user]), notice: "既にログインしています。"
    end
  end
  
  def create
    if session[:user]
      redirect_to user_path(session[:user]), notice: "既にログインしています。"
    else
      user = User.find_by(name: params[:name])
      if user && user.authenticate(params[:password])
        session[:user] = user.id
        redirect_to user, notice: "ログインしました"
      else
        render :new
      end
    end
  end
  
  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました。"
  end
end
