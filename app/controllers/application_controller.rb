class ApplicationController < ActionController::Base
  def check_admin
    forbidden! unless current_user.has_role?(:admin)
  end

  def belongs_to_editor_user_or_is_admin article
    forbidden! unless current_user.has_role?(:admin) || (article.user == current_user && current_user.has_role?(:editor))
  end

  def check_editor
    forbidden! unless current_user.has_roles?(:editor, :admin)
  end
end
