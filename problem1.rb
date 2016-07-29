def anagrams?(a, b)
	return a.chars.sort == b.chars.sort
end

puts anagrams?('momdad', 'dadmom')