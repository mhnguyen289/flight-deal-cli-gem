#CLI Controller
class FlightDeal::CLI

	def call
		puts "Welcome to Flight Deals!"
		puts "Choose a city to find Flight Deals"
		list_cities
		menu
		goodbye
	end

	def list_cities
		puts <<-DOC
			1. New York City
			2. San Francisco
			3. Los Angeles
			4. Boston
			5. Chicago
			6. Dallas
			7. Miami
			8. Philadelphia
			9. Phoenix
			10. Portland
			11. Seattle
			12. Washington D.C.
		DOC
	end

	def menu
		input = nil 
		while input != "exit"
			puts "Enter the number for more info, type list for all the cities, or type exit to enter:"
			input = gets.strip.downcase
			case input
			when "1"
				puts "More info on deal 1..."
			when "2"
				puts "More info on deal 2..."
			when "list"
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