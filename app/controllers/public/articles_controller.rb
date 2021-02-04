class Public::ArticlesController < ApplicationController
  before_action :setup, only: [:index, :new, :create]

  def index
  end

  def show
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
  end
  
  private
    def setup
      @homepage = Homepage.find(params[:homepage_id])
      @user = @homepage.user
    end
    
    def article_params
      params.require(:article).permit(:title, :content, :tag)
    end
end
