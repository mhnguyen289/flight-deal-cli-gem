
class FlightDeal::Scraper

BASE_URL = "http://www.theflightdeal.com/category/flight-deals/"

	def scrape_cities
		doc = Nokogiri::HTML(open("http://www.theflightdeal.com/category/flight-deals/"))
		doc.search("ul.sub-menu").first.search("li a").collect do |city| 	
			
			 new_city = FlightDeal::City.new
			 new_city.name = city.text
			 new_city.search_id = city.attributes["href"].value.gsub("http://www.theflightdeal.com/category/flight-deals/", "")
			 new_city.url = city.values
		end
	end
	

	def scrape_deals(city) #returns a list of deal hashes
			api_query = "#{BASE_URL + city.search_id}"
			doc = Nokogiri::HTML(open(api_query))
			 @city_deals = doc.search("h1.post-title").search("a").collect do |deal|
			 	
				new_deal = FlightDeal::Deal.new #creates new deal object
				new_deal.city = city #object collab, creates instances of chosen cities @deals = [], @search_id, @url
				new_deal.description = deal.text
				new_deal.url =  deal.values.first
				new_deal.save
				city.deals << new_deal #new_deal is saved into the @deals instance array
				#saves the name, search_id, url for the city chosen into @city_deals instance			
				end
			city.deals #displays the cities attr with the chosen deals url for the city
		end

	end

