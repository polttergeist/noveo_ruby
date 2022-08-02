module IndifferentAccessable
  def [](key)
    return super(key) unless super(key).nil?
    if key.class == Symbol
      super(key.to_s)
    elsif key.class == String
      super(key.to_sym)
    end
  end
end

class Hash
  def make_indifferent_accessable!
    self.extend(IndifferentAccessable)
    self
  end
end
