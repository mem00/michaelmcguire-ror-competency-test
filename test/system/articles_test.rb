require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "can't create post if no user" do
    visit new_article_path
    assert_text "Log in"
  end
end