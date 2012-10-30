require 'spec_helper'

describe WelcomeController do

  it 'get index' do
    get 'index'
    response.status.should == 200
  end

end
