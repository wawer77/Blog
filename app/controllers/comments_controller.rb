class CommentsController < ApplicationController

  def index
    @coments = Comment.all
  end

  def show
  end

  def new
    @comment = current_user.comments.build(comment_params)
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment added"
      redirect_to @article
    else
      flash[:alert] = "Sth went wrong"
      redirect_to @article
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.update(comment_params)
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
