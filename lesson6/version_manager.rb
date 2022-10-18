class VersionManager
  def initialize(str = '0.0.1')
    arr = str.split('.')
    arr = arr[0..2] if arr.length > 3
    arr << '0' until arr.length == 3
    arr.each do |i|
      i.each_char { |j| unless ('0'..'9') === j then raise ArgumentError end }
    end
    @release = arr.map(&:to_i)
    @history = []
  end

  def major!
    @history.unshift(@release)
    @release[0] += 1
    @release[1] = 0
    @release[2] = 0
  end

  def minor!
    @history.unshift(@release)
    @release[1] += 1
    @release[2] = 0
  end

  def patch!
    @history.unshift(@release)
    @release[2] += 1
  end

  def rollback!
    if @history == [] then raise ArgumentError end
    @release = @history.shift
  end

  def release
    @release.map(&:to_s).join('.')
  end
end
