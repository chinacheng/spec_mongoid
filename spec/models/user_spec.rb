require 'spec_helper'
describe User do 

  before do
    @user = User.new(:name => "lucy", :login => "lucy", :age => 18)
  end

  it "descibe lucy" do
    @user.name.should == "lucy"
    @user.age.should == 18
  end
end
