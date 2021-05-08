class Admin::ArticlesController < Admin::BaseController
  before_action :check_if_article_exists, only: %i[show edit update destroy]
  before_action :check_if_user_is_admin, only: %i[new edit create update destroy]

  def index
    @articles = Article.all.page(params[:page]).per(10)
  end

  def show
    # @article is defined in check_if_article_exists method
  end

  def new
    @article = current_user.articles.build()
  end

  def edit
    # @article is defined in check_if_article_exists method
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Article created!"
      redirect_to admin_articles_path
    else
      render 'new'
    end
  end

  def update 
    if @article.update(article_params)
      flash[:success] = "Article updated"
      redirect_to admin_article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:success] = "Article deleted"
    redirect_to admin_articles_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :description, :content)
    end

    def check_if_article_exists
      if !Article.exists?(params[:id])
        flash[:info] = "Article not found"
        redirect_to admin_articles_path
      end
      @article = Article.find(params[:id])
    end
    
end
