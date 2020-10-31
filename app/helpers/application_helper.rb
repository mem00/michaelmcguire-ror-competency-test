module ApplicationHelper

  def belongs_to_user_or_is_admin article
    logged_in?(:admin) || article.user == current_user
  end

end
