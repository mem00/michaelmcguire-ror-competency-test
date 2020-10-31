class ApplicationController < ActionController::Base
  def check_admin
    forbidden! unless logged_in?(:admin)
  end

  def belongs_to_user_or_is_admin article
    forbidden! unless logged_in?(:admin) || article.user == current_user
  end

  def check_user
    forbidden! unless current_user
  end
end
