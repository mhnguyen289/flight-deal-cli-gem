
require_relative 'city'

class FlightDeal::City
	attr_accessor :name, :url

	def self.all
		#should return a bunch of instances of City
		#scrape theflightdeal and return deals based on that data
		self.scrape_cities
	end

	def self.scrape_cities
		cities = []

		cities << self.scrape_theflightdeal

		#go to theflightdeal, find the city
		#instantiate city
		cities
	end

	def self.scrape_theflightdeal
		doc = Nokogiri::HTML(open("http://www.theflightdeal.com/"))

		city = self.new
		city.name = doc.search("ul.sub-menu").text
	end

end

