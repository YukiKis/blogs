class Public::UsersController < ApplicationController
  before_action :setup, except: :new
  def setup
    @user = User.find(session[:user])
  end
  
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def edit
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :introduction, :password, :password_confirmation, :agreement)
    end
end
