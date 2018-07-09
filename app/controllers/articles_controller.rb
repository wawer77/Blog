class ArticlesController < ApplicationController

  def index
    @articles =Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
    #if function for saving or not to be added
  end

  def update
    @article=Article.find(params[:id])
    @article.update(article_params)
    redirect_to @article
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    end

  #PRIVATE methods
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
