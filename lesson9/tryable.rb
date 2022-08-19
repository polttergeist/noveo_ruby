module Tryable
  def try(&block)
    block.call(self)
  rescue NoMethodError
    nil
  end
end

def add_num(num)
  proc { |base_num| num + base_num }
end
