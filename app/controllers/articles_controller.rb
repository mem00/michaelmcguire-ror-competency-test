class ArticlesController < ApplicationController
  access admin: :all
  access user: :show
  before_action :set_article, except: [:index, :new, :create]
  before_action :check_editor, only: [:new, :create]
  before_action only: [:destroy, :edit, :update] do
    belongs_to_editor_user_or_is_admin @article
  end
  access [:user, :editor] => :all, message: "You shall not pass"
  
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