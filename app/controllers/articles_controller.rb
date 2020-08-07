class ArticlesController < ApplicationController
  def show # show => display individual article as requested
    @article = Article.find(params[:id]) #find by id
    # @variable is an instance variable supaya bisa dipake di html.erb
  end

  def index # index => display all articles available
    @articles = Article.all
  end

  def new
    @article = Article.new # so the first time the new.html.erb loads, no error caused by @article.errors in the new.html.erb
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
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
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path # this articles_path will redirect to the articles listing page which is the def index
  end
end