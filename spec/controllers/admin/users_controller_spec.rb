require 'spec_helper'

describe Admin::UsersController do

  it 'create a user' do
    get :new 
    response.should render_template('new')
    assert_select 'form.new_user' do
      assert_select 'input[name=?]', 'user[name]'
      assert_select 'input[name=?]', 'user[age]'
      assert_select 'input[name=?]', 'user[password]'
      assert_select 'input[name=?]', 'user[email]'
      assert_select 'input[name=?]', 'user[password_confirmation]'
      assert_select 'input[type=?]', 'submit'
    end

    post :create, :user => {:name => 'test_name', :age => 20, :email => 'hello@test.com', :password => '123456', :password_confirmation => '123456'}
    new_user = assigns[:user]
    new_user.should_not be_new_record   
    new_user.name.should == 'test_name'
    new_user.email.should == 'hello@test.com'
    new_user.age.should == 20
    response.should redirect_to(:action => :index)
  end

end
