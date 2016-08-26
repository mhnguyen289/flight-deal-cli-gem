
class FlightDeal::City
	attr_accessor :name, :deals, :url, :description, :search_id
	
	@@cities = [] # all cities

	def initialize 
		@deals = [] #all deals for this city
		@@cities << self
	end

	def self.all
		@@cities
	end

end
