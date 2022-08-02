module Useful
  def capitalize_each_word
    self.split(' ').map(&:capitalize).join(' ')
  end
end

public

def capitalizable!
  self.singleton_class.include(Useful)
  self
end
