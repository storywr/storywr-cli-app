class Cli

	def call
		loop do
			puts "Welcome to NFL Helper!"
			puts "Enter 'list' to list games for the current week"
			input = gets.strip
				if input == "list"
					list_games
					break
				end
		end
	end


	def list_games
		puts "NFL Games this Week:"
		puts "Would you like to check ticket prices? (y/n)"
		input = gets.strip
			if input == "y"
				puts "Enter the number of the game you would like to see"
				input = gets.strip
			end
	end

end