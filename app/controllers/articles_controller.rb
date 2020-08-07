class ArticlesController < ApplicationController
  def show # show => display individual article as requested
    @article = Article.find(params[:id]) #find by id
    # @variable is an instance variable supaya bisa dipake di html.erb
  end

  def index # index => display all articles available
    @articles = Article.all
  end
end