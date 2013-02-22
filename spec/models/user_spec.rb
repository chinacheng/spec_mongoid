require 'spec_helper'

describe User do 

  before do
    @user = User.new(:name => 'lucy', :login => 'lucy', :age => 18)
  end

  it 'descibe lucy' do
    @user.name.should == 'lucy'
    @user.age.should == 18
  end

  it 'save lucy failure' do
    assert_no_difference('User.count') do
      @user.save
    end
  end

  it 'save lucy with the full attributes' do
    @user.email = 'lucy@tesst.com'
    @user.password = '123456'
    assert_difference('User.count', 1) do
      @user.save
    end
  end

  it 'create a user by factory girl' do
    assert_no_difference('User.count') do 
      FactoryGirl.build(:user)
    end
  
    assert_difference('User.count', 1) do
      FactoryGirl.create(:user)
    end
  end

  it 'use factory girl to create many users' do
    assert_difference('User.count', 10) do
      10.times{|i| FactoryGirl.create(:user) }
    end
  end

end
