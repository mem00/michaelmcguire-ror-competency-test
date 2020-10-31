class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:articles).all
  end

  def show
    @category = Category.includes(:articles).find(params[:id])
    @articles = @category.articles
  end

end