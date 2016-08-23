#CLI Controller
class FlightDeal::CLI

	def call
		puts "Welcome to FlightDeal!"
		FlightDeal::Scraper.new.scrape_cities
		choose_city
	end

	def list_cities
		puts "Choose a city to find Flight Deals"
		puts "----------------------------------------------------------------"
		FlightDeal::City.all.each_with_index do |city, index|
			puts "#{index + 1}. #{city.name}"
		end
		puts "----------------------------------------------------------------"
	end

	def choose_city
		city_choice = nil 
		until city_choice == 'exit'
			list_cities
			puts "Enter the number for more info or type exit to leave program"
			city_choice = gets.strip.downcase

			if city_choice == 'exit'
				puts "Now exiting the program. See you later!"

			elsif city_choice.to_i  <= FlightDeal::City.all.size
				city = FlightDeal::City.all[city_choice.to_i - 1]
				@city_deals = FlightDeal::Scraper.new.scrape_deals(city) #create a new scarper & pull deals for that city
				puts "here are the recent deals from #{city.name}"
				puts "----------------------------------------------------------------"
				@city_deals.each_with_index do |deal, index|
					puts "#{index + 1}. #{deal}"
				end
				puts "----------------------------------------------------------------"
				choose_deal
			else
				puts "Sorry I didnt get that, Please try again"
			end
		end
	end

	def choose_deal
			deal_choice = nil 
		until deal_choice == 'exit'
			puts "Choose a deal to see more details or back to main menu with 'exit'"
			deal_choice = gets.strip.downcase
			if deal_choice == 'exit'
				puts "Now exiting back to main menu..."

			elsif deal_choice.to_i <= @city_deals.size
				 deal = @city_deals[deal_choice.to_i - 1]
				 #@city_deals = FlightDeal::Scraper.new.scrape_deals(city)
				 # puts "Here are the deal details"
				 # puts "----------------------------------------------------------------"
				 # # @deal_details = Flightdeal::Scraper.new.scrape_deals(city)
				 puts "Here is the deal you chose: #{deal}"
				 puts "----------------------------------------------------------------"
				 deal_detail
				else
					puts "Sorry I didn't get that, please try again"
				end
			end
		end

		def deal_detail
			detail_choice = nil
			until detail_choice == 'exit'
				puts "Here are the deals details, type exit to go back"

				detail_choice = gets.strip.downcase
				if detail_choice == 'exit'
					puts "Now going back to the city deals"

				# elsif detail_choice.to_i <= @deal_details.size
				# 	detail = @deal_details[detail_choice.to_i - 1]
				   @deal_details = FlightDeal::Scraper.new.scrape_details(detail)
					@deal_details.each do |detail|
						binding.pry
					puts "#{detail_choice}. #{city.name}"
					puts "Travel Date: #{deal.travel_date}"
					
				 	puts "----------------------------------------------------------------"
				 	puts "Would you like to read this story in the browser?"
				 	answer = gets.strip.downcase
				 if answer.include?('y')
				 	system('open', "#{deal.url}")
				 end
				 deal_choice = nil
				end
				# else 
				# 	puts "sorry please try again."
				# end
			end
		end
	end
end