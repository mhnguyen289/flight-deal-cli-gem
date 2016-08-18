#CLI Controller
class FlightDeal::CLI

	def call
		puts "Welcome to Flight Deals!"
		
		list_cities
		menu
		goodbye
	end

	def list_cities
		puts "Choose a city to find Flight Deals"
		@cities = FlightDeal::City.all
		@cities.each.with_index(1) do |city, i|
			puts "#{i}. #{city.name}"
		end
	end

	def menu
		input = nil 
		while input != "exit"
			puts "Enter the number for more info, type list for all the cities, or type exit to enter:"
			input = gets.strip.downcase
			
			if input.to_i > 0
				the_city = @cities[input.to_i-1]	
				puts  "#{the_city.name}"
			elsif input == "list"
				list_cities
			else
				puts "Not sure what you want, type list or exit."
			end
		end
	end

	def goodbye
		puts "Come back later or else you'll miss the deals!"
	end





end