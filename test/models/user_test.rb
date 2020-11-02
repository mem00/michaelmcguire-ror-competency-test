require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is admnin" do
    user = User.new
    user.email = "test@test.com"
    user.password = "123456"
    user.roles = "admin"
    user.save!
    assert user.roles.include? :admin
  end
end

