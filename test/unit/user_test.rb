# encoding: utf-8
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create a User' do
    assert_difference 'User.count',1 do
      user = User.new(:name=>'李磊', :age=>15, :login=>'lilei',:email=>'lilei@123.com', :password=>'123456', :password_confirm=>'123456')
      user.save
    end
    lilei = User.last
    assert_equal [lilei.name,lilei.age,lilei.login] , ['李磊', 15, 'lilei']
  end
end
