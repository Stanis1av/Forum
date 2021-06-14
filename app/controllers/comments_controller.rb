class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_article_comment, only: [:show, :update, :destroy]

  # GET /articles/:article_id/comments
  def index
    json_response(@article.comments)
  end

  # GET /articles/:article_id/comments/:id
  def show
    json_response(@comment)
  end

  # POST /articles/:article_id/comments
  def create
    @article.comments.create!(comment_params)
    json_response(@article, :created)
  end

  # PUT /articles/:article_id/comments/:id
  def update
    @comment.update(comment_params)
    head :no_content
  end

  # DELETE /articles/:article_id/comments/:id
  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.permit(:body, :author, :user_id)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_article_comment
    @comment = @article.comments.find_by!(id: params[:id]) if @article
  end
end
