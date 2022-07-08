def sum arr
	if arr.length == 1
		return arr[0]
	end
	arr.shift + sum(arr)
end

puts sum [2, 3, 4, 5]