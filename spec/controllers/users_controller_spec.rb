require 'spec_helper'

describe UsersController do

  render_views 

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
    response.should redirect_to(:action => :index)
  end

end
