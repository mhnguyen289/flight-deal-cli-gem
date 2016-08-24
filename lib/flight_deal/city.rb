
class FlightDeal::City
	attr_accessor :name, :deals, :url, :search_id, :date, :description
	
	@@cities = [] # all cities

	def initialize 
		@deals = [] #all deals for this city
		@@cities << self
	end

	def self.all
		@@cities
	end

end
