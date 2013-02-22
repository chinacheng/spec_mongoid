# coding: utf-8

def assert_difference(execute, number=1, &block)
  before_size = eval(execute)
  yield
  end_size = eval(execute)
  end_size.should == before_size + number
end

def assert_no_difference(execute, &block)
  assert_difference(execute, 0, &block)
end
