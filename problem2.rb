require 'rubygems'
require 'date'
require 'json'

def sort
	google = [
    {
        start: "2015-11-01T10:00:00.00+08:00",
        end: "2015-11-01T11:00:00.00+08:00"
    },
    {
        start: "2015-11-01T11:00:00.00+08:00",
        end: "2015-11-01T14:00:00.00+08:00"
    },
    {
        start: "2015-11-01T15:00:00.00+08:00",
        end: "2015-11-01T17:00:00.00+08:00"
    }
	]

	ical = [
    {
        start: "2015-11-01T12:00:00.00+08:00",
        end: "2015-11-01T13:00:00.00+08:00"
    },
    {
        start: "2015-11-01T13:00:00.00+08:00",
        end: "2015-11-01T14:00:00.00+08:00"
    },
    {
        start: "2015-11-01T14:00:00.00+08:00",
        end: "2015-11-01T15:00:00.00+08:00"
    },
    {
        start: "2015-11-01T15:00:00.00+08:00",
        end: "2015-11-01T16:00:00.00+08:00"
    }
	]


	slots = google + ical
	
	# for i in (1..slots.size - 1)  
	# 	key = DateTime.iso8601(slots[i][:start])
	# 	j = i - 1
	# 	while j >= 0 and DateTime.iso8601(slots[j][:start]) > key do
	# 		slots[j+1] = slots[j]
	# 		j = j-1
	# 	end
	# 	slots[j+1] = slots[i]
	# end

	slots = slots.sort_by { |slots| slots[:start] }

	perm = Array.new(slots.size, true)

	for i in 0..slots.size-1
		if perm[i] == true
			for j in i+1..slots.size-1
				if DateTime.iso8601(slots[i][:end]) > DateTime.iso8601(slots[j][:start])
					perm[j] = false
				end
			end
		end
	end
	unique_slots = []
	
	for i in 0..perm.size-1
		if perm[i] == true
			unique_slots << slots[i]
		end
	end
	unique_slots
end

puts sort

