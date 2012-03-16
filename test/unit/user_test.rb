# encoding: utf-8
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create a User" do
    assert_difference "User.count",1 do
      User.create(:name=>"李磊",:age=>15,:login=>"lilei")
    end
    lilei = User.last
    assert_equal [lilei.name,lilei.age,lilei.login],["李磊",15,"lilei"]
  end
end
