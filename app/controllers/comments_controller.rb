class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)

    @comment.author_name = current_user.usename

    @comment.save

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
