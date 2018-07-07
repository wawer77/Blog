class ArticlesController < ApplicationController

  def new

  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
    #if function for saving or not to be added
  end


  #PRIVATE methods
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
