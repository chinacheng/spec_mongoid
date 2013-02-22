# coding: utf-8

def assert_difference(expression, difference = 1, message = nil, &block)
  expressions = Array.wrap expression

  exps = expressions.map { |e|
    e.respond_to?(:call) ? e : lambda { eval(e, block.binding) }
  }
  before = exps.map { |e| e.call }

  yield

  expressions.zip(exps).each_with_index do |(code, e), i|
    error  = "#{code.inspect} didn't change by #{difference}"
    error  = "#{message}.\n#{error}" if message
    (before[i] + difference).should == e.call
  end
end

def assert_no_difference(expression, difference = 1, message = nil, &block)
  assert_difference expression, 0, message, &block
end
