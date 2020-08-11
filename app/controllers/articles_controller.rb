class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  # execute the method before all method is performed or any specified method

  def show # show => display individual article as requested
    # @variable is an instance variable supaya bisa dipake di html.erb
  end

  def index # index => display all articles available
    @articles = Article.all
  end

  def new
    @article = Article.new # so the first time the new.html.erb loads, no error caused by @article.errors in the new.html.erb
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.find(6)
    # line above => require the top level key of :article and permit the :title and :description to be used by @article
    if @article.save # if the article is saved then notify the user and redirect
      flash[:notice] = "Article was created successfully!" # flash taroh di layouts/application.html.erb
      # redirect_to article_path(@article)
      # rails will extract the id from the @article and send it to form the path
      # shortcut dari line 18 adalah line di bawah ini
      redirect_to @article
    else # else, render the new.html.erb through def new
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was deleted successfully!"
    redirect_to articles_path # this articles_path will redirect to the articles listing page which is the def index
  end

  private # means that methods below this line can only be used inside this controller
  
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end