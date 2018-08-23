class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order("created_at DESC").paginate(page: params[:page], per_page: 2)
  end

  def show
    @article = Article.find(params[:id])
    @com_in = 1
  end

  def new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      flash.now[:alert] = "Something went wrong!"
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
