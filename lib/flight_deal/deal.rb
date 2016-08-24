class FlightDeal::Deal
	attr_accessor :description, :deal_details, :url, :city

	@@deals = [] #all deals, all cities

	def save
		@@deals << self
	end

	def self.all
		@@deals
	end



end
