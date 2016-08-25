
class FlightDeal::City
	attr_accessor :name, :deals, :url, :description
	
	@@cities = [] # all cities

	def initialize 
		@deals = [] #all deals for this city
		@@cities << self
	end

	def self.all
		@@cities
	end


	# def self.deals
	# 	puts <<-DOC
	# 		1. Qatar Airways – $832: New York – Bali, Indonesia. Roundtrip, including all Taxes
	# 		2. The Shorthaul – American / Delta / jetBlue – $156: New York – Orlando / Fort Myers / Jacksonville, Florida (and vice versa). Roundtrip, including all Taxes
	# 	DOC

	# 	deal_1 = self.new
	# 	deal_1.description = "Qatar Airways – $832: New York – Bali, Indonesia. Roundtrip, including all Taxes"
	# 	deal_1.travel_date = "September 26th – October 3rd"

	# 	city_2 = self.new
	# 	city_2.name = "The Shorthaul – American / Delta / jetBlue – $156: New York – Orlando / Fort Myers / Jacksonville, Florida (and vice versa). Roundtrip, including all Taxes"
	# 	city_2.tavel_date = "September 15th – 18th"

	# 	[deal_1, deal_2]


	# end


end
