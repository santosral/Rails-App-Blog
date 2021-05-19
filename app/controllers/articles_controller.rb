class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.valid? && @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def delete
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to '/articles'
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "You've successfully updated your blog!"
      redirect_to articles_path
    else
      flash[:notice] = "Failed to edit your blog!"
      render :edit
    end
  end

  private
  def article_params
    params.require(:article).permit(:name, :body)
  end
end
