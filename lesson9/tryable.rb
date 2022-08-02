module Tryable
  def try(&block)
    block.call(self)
    rescue NoMethodError
      nil
  end
end

def add_num(i)
  proc { |j| i+j }
end
