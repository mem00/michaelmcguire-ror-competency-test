class ArticlesController < ApplicationController
  before_action :set_article, except: [:index, :new, :create]
  before_action :check_user, except: [:show]
  before_action only: [:destroy, :edit] do
    belongs_to_user_or_is_admin @article
  end
  
  def show
  end

  def new
    @article = Article.new
    @categories = Category.order(:name)
  end

  def edit
    @categories = Category.order(:name)
  end

  def create
    params = article_params.merge({user: current_user})
    Article.create!(params)
    redirect_to root_path and return
  rescue => e
    puts "Error: #{e}"

  end

  def update
    @article.update_attributes!(article_params)
    redirect_to root_path and return
  rescue => e
    puts "Error: #{e}"
  end

  def destroy
    @article.destroy
    redirect_to root_path and return
  rescue => e

  end

  private

  def article_params
    params.require(:article).permit(
      :title,
      :content,
      :category_id
    )
  end

  def set_article
    @article = Article.find(params[:id])
  end

end