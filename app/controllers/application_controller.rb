class ApplicationController < ActionController::Base
  def check_admin
    forbidden! unless logged_in?(:admin)
  end
end
