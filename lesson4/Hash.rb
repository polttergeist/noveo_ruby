class HashWithIndifferentAccess < Hash
  def initialize(h)
    h.each { |k, v| self[convert_key(k)] = v }
  end

  def get_key(key)
    self[convert_key(key)]
  end

  def convert_key(key)
    key.is_a?(Symbol) ? key.to_s : key
  end

  def [](key)
    super(convert_key(key))
  end

  def []=(key, val)
    self.store(convert_key(key), val)
  end
end

class Hash
  def with_indifferent_access
    HashWithIndifferentAccess.new(self)
  end
end

h = { a: 'apple' }.with_indifferent_access
p h['a'] # => apple
h[:foo] = 'bar'
p h['foo']  # => bar
