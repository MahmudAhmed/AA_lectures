require_relative "code"

class Mastermind

    def initialize(len)
        @secret_code = Code.random(len) #factory method
    end

    def print_matches(guess)
        puts "Exact Matches: #{@secret_code.num_exact_matches(guess)}"
        puts "Near Matches: #{@secret_code.num_near_matches(guess)}"
    end

    def ask_user_for_guess
        puts "Enter a code: "
        guess = Code.from_string(gets.chomp)
        print_matches(guess)
        @secret_code == guess
    end
end
