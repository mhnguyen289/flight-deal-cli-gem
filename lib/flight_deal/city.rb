
class FlightDeal::City
	attr_accessor :name, :deal, :url, :search_id, :date, :description
	
	@@cities = [] # all cities

	def initialize 
		@deals = [] #all deals for this city
		@@cities << self
	end

	def self.all
		@@cities
	end

end
