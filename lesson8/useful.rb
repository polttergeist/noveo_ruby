module Useful
  def capitalize_each_word
    self.split(' ').map(&:capitalize).join(' ')
  end
end

public

def capitalizable!
  self.extend(Useful) # self.singleton_class.include(Useful) works too
end
