class CommentsController < ApplicationController

  def index
    @coments = Comment.all
  end

  def show
    @user_id = @article.comment.user_id
    @user = Article.find(params[:user_id])
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
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end
