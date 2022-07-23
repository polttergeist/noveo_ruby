class HashWithIndifferentAccess < Hash
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
  def with_indifferent_access
    HashWithIndifferentAccess[self]
  end
end

h = { a: 'apple' }.with_indifferent_access
p h['a'] # => apple
h[:foo] = 'bar'
p h['foo']  # => bar
h[:one] = 'one'
p h[:one]
h['two'] = 'two'
p h['two']
