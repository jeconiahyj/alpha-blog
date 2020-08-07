class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id]) #find by id
    # @variable is an instance variable supaya bisa dipake di html.erb
  end
end