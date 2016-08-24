class FlightDeal::Deal
	attr_accessor :description, :details, :travel_date, :city, :name, :url

	@@deals = [] #all deals, all cities

	def save
		@@deals << self
	end

	def self.all
		@@deals
	end



end
