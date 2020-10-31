class Admin::UsersController < ApplicationController
  before_action :check_admin
  before_action :set_user, except: [:index, :new, :create]
  access admin: :all
  access [:user, :editor] => :all, message: "You shall not pass"

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    User.create!(user_params)
    redirect_to admin_users_path and return
  rescue => e
    puts "Error: #{e}"
  end

  def update
    update_params = {
      email: user_params[:email],
      roles: user_params[:roles]
    }
    update_params.merge({password: user_params[:password]}) if user_params[:password].present?
    @user.update_attributes!(update_params)
    redirect_to admin_users_path and return
  rescue => e
    puts "Error: #{e}"
  end


  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :roles
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

end