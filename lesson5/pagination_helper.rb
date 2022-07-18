class PaginationHelper
  def initialize(arr, count)
    @paginated = []
    @item_count = arr.length
    @count = count
    while arr.length > 0 do
      @paginated.append(arr.shift(count))
    end
  end

  def page_count
    @paginated.length
  end

  def item_count
    @item_count
  end

  def page_item_count(i)
    return -1 unless i >= 0 and i < self.page_count
    @paginated[i].length
  end

  def page_index(i)
    return -1 unless i >= 0 and i < self.item_count
    i / @count
  end
end

