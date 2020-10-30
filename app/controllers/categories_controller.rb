class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:articles).all
  end


end