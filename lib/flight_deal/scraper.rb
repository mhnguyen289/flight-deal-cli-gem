require 'pry'
class FlightDeal::Scraper

BASE_URL = "http://www.theflightdeal.com/category/flight-deals/"
BASE_URL_1 = "http://www.theflightdeal.com/"



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
		
			api_query = "#{BASE_URL + city.search_id.to_s}"
			doc = Nokogiri::HTML(open(api_query))
			 @city_deals = doc.search("h1.post-title").search("a").collect do |deal|
				
				new_deal = FlightDeal::Deal.new
				new_deal.city = city
				new_deal.description = deal.text
				new_deal.url =  deal.values.first
				new_deal.save
				city.deals << new_deal

			end
			city.deals
		end
	

	def scrape_details(deal)
		
		# @detail = detail.strip.downcase.gsub(/(&|&amp;)/, ' and ').gsub(/[\s\.\/\\]/, '-').gsub(/[^\w-]/, '').gsub(/[-_]{2,}/, '-').gsub(/^[-_]/, '').gsub(/[-_]$/, '')
		# api_query = "#{BASE_URL_1 + } + #{@detail}"
			doc = Nokogiri::HTML(open(deal))
			@deal_details = doc.search(".entry-content").first.search("ul").collect do |detail|
				
				new_detail = FlightDeal::Deal.new
				new_detail.deal = deal
				new_detail.travel_date = detail.text
				new_detail.save
				deal.details << new_detail
			end
			deal.details
		end
	end

