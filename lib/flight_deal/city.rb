class FlightDeal::City
	attr_accessor :name, :url

	def self.all
		#should return a bunch of instances of City
		puts <<-DOC
			1. New York City
			2. San Francisco
			3. Los Angeles
			4. Boston
			5. Chicago
			6. Dallas
			7. Miami
			8. Philadelphia
			9. Phoenix
			10. Portland
			11. Seattle
			12. Washington D.C.
		DOC
		city_1 = self.new
		city_1.name = "New York City"
		city_1.url = "http://www.theflightdeal.com/category/flight-deals/nyc/"

		city_2 = self.new
		city_2.name = "San Francisco"
		city_2.url = "http://www.theflightdeal.com/category/flight-deals/sfo/"

		[city_1, city_2]

	end

end