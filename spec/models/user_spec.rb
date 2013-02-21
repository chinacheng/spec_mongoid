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
    begin_count = User.count
    @user.save
    end_count = User.count
    (end_count - begin_count).should be 0 
  end

  it 'save lucy with the full attributes' do
    @user.email = 'lucy@tesst.com'
    @user.password = '123456'
    begin_count = User.count
    @user.save
    end_count = User.count
    (end_count - begin_count).should be 1 
  end

end
