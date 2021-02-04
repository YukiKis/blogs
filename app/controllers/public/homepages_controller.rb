class Public::HomepagesController < ApplicationController
  before_action :setup
  
  def setup
    @user = User.find(session[:user])
  end
  
  def index
    @homepages = @user.homepages.all
  end

  def show
    @homepage = Homepage.find(params[:id])
    @article = @homepage.articles.first
  end

  def new
    @homepage = @user.homepages.new
  end
  
  def create
    @homepage = @user.homepages.new(homepage_params)
    if @homepage.save
      redirect_to homepage_path(@homepage), notice: "ホームページが作成できました"
    else
      render :new
    end
  end

  def edit
  end
  
  def list
    @homepages = Homepage.all
  end
  
  private
    def homepage_params
      params.require(:homepage).permit(:title, :introduction, :agreement) 
    end
end
