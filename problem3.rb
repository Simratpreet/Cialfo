def scrape
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	# Fetch and parse HTML document
	doc = Nokogiri::HTML(open('http://colleges.usnews.rankingsandreviews.com/best-colleges/rankings/national-universities/data'))
	# puts doc.at_css("title").text
	# # doc.css(".school-name").each do |name|
	# # 	puts name.text
	# # end
	colleges = []
	i = 0
	doc.css('td').each do |td|
		school = td.css('.school-name')
		location = td.css('.location')
		puts doc.css('.search_tuition_display')[i]
		# if !doc.css('.search_tuition_display')[i].text.empty?
		# 	fees = doc.css('.search_tuition_display')[i].text
		# end
		total = td.css('.total_all_students')
		if !school.text.empty?
			colleges[i] = { "name" => school.text, "location" => location.text, "fees" => fees.text, 
				"total_enrollments" => total.text }
			i = i + 1
		end
		#puts td.css('.location').text
		#colleges[i] = { "name" => td.css('.school-name').text }
	end

	colleges

end

puts scrape