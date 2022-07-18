def sum arr
	return nil if arr == []
	if arr.length == 1
		return arr[0]
	end
	arr.shift + sum(arr)
end
