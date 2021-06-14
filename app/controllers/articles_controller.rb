class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @articles = Article.all
    json_response(@articles)
  end

  # POST /todos
  def create
    @article = Article.create!(article_params)
    json_response(@article, :created)
  end

  # GET /todos/:id
  def show
    json_response(@article)
  end

  # PUT /todos/:id
  def update
    @article.update(article_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @article.destroy
    head :no_content
  end

  private

  def article_params
    # whitelist params
    params.permit(:title, :body, :author, :user_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
