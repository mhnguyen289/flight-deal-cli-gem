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
		all_cities = FlightDeal::City.all.each_with_index do |city, index|
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
				@city_deals = FlightDeal::Scraper.new.scrape_deals(city) #pulls deals for that city
				puts "here are the recent deals from #{city.name}"
				puts "----------------------------------------------------------------"
				@city_deals.each_with_index do |deal, index|
					puts "#{index + 1}. #{deal.description}"
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
				 
				 puts "Here is the deal you chose: #{deal.description}"
				 puts "Here is the deal URL #{deal.url}"
				 puts "----------------------------------------------------------------"

				 puts "Would you like to read this story in the browser?"
				 answer = gets.strip.downcase
				 if answer.include?('y')
				 	system('open',"#{deal.url}")
				else
					deal_choice = nil
					puts "Sorry please try again."
				end
			end# if loop
		end#until
	end
end
				
