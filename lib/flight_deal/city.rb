
class FlightDeal::City
	attr_accessor :name, :deals, :search_id, :url, :description
	
	@@cities = [] # all cities

	def initialize 
		@deals = [] #all deals for this city
		@@cities << self
	end

	def self.all
		@@cities
	end

end
