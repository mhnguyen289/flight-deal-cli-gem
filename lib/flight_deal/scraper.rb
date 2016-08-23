class FlightDeal::Scraper

BASE_URL = "http://www.theflightdeal.com/category/flight-deals/"



	def scrape_cities
		doc = Nokogiri::HTML(open("http://www.theflightdeal.com/category/flight-deals/"))
		doc.search("ul.sub-menu").first.search("li a").collect do |city| 	
			
			 new_city = FlightDeal::City.new
			 new_city.name = city.text
			 new_city.search_id = city.attributes["href"].value.gsub("http://www.theflightdeal.com/category/flight-deals/", "")
			 new_city.url = city.values
			 #new_city.description = 

			
		end
	end
	

	def scrape_deals(city) #returns a list of deal hashes
			api_query = "#{BASE_URL + city.search_id.to_s}"
			doc = Nokogiri::HTML(open(api_query))
			@city_deals = doc.search("h1.post-title").children.search("a").collect do |deal|
				new_deal = FlightDeal::Deal.new
				
				
				new_deal.description = deal.text
				new_deal.url =  deal.values.first
				
			end
		end
	

	def scrape_details(detail)
		binding.pry
		api_query = "#{deal}"
			doc = Nokogiri::HTML(open(api_query))
			@deal_details = doc.search(".entry-content").first.search("ul").collect do |detail|
				new_deal = FlightDeal::Deal.new
				
				
				
			end
			 
	end
	
end
