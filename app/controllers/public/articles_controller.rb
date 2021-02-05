class Public::ArticlesController < ApplicationController
  before_action :setup_hp, only: [:index, :new, :create]

  def index
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.homepage.user
  end

  def new
    @article = @homepage.articles.new
  end
  
  def create
    @article = @homepage.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: "新しい記事を作成しました"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    @user = @article.homepage.user
    unless @user.current_user?(session[:user])
      redirect_to article_path(article), notice: "編集出来ません"
    end
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "更新出来ました"
    else
      render :edit
    end
  end
  
  private
    def setup_hp
      @homepage = Homepage.find(params[:homepage_id])
      @user = @homepage.user
    end
    
    def article_params
      params.require(:article).permit(:title, :content, :tag)
    end
end
