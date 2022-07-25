class VersionManager
  attr_accessor :release, :history

  def initialize(str = '0.0.1')
    arr = str.split('.')
    if arr.length > 3 then arr = arr[0..2] end # throwing away redundant elements
    until arr.length == 3 do arr << 0 end # filling up the array if the argument isn't in its full form
    arr.each do |i| # checking elements to be integers, otherwise raising an exception
      i.each_char { |j| unless ('0'..'9') === j then raise NoMethodError end }
    end
    @release = arr.join('.')
    @history = []
  end

  def major!
    arr = @release.split('.')
    arr[0] = (arr[0].to_i + 1).to_s
    arr[1] = '0'
    arr[2] = '0'
    @history.unshift(@release)
    @release = arr.join('.')
  end

  def minor!
    arr = @release.split('.')
    arr[1] = (arr[1].to_i + 1).to_s
    arr[2] = '0'
    @history.unshift(@release)
    @release = arr.join('.')
  end

  def patch!
    arr = @release.split('.')
    arr[2] = (arr[2].to_i + 1).to_s
    @history.unshift(@release)
    @release = arr.join('.')
  end

  def rollback!
    if @history == [] then raise NoMethodError end
    @release = @history.shift
  end
end
