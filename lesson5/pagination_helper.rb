class PaginationHelper
  attr_accessor :unpaginated
  attr_reader :item_count, :count

  def initialize(arr, count)
    @unpaginated = arr
    @item_count = arr.length
    @count = count
  end

  def page_count
    (item_count.to_f / count).ceil
  end

  def page_item_count(i)
    return -1 unless i >= 0 && i < self.page_count
    if item_count <= count
      item_count
    else
      unpaginated[i*count...(i+1)*count].length
    end
  end

  def page_index(i)
    return -1 unless i >= 0 && i < self.item_count
    i / count
  end
end

