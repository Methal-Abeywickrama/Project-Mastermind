module Ply

  def play (game)
    no_of_attempts = 10
  
    until (game.correct_number == 4 && game.matches == 4) || no_of_attempts <= 0
      puts "#{@breaker_name}, you have #{no_of_attempts} attempts to crack the code."
      puts "enter your guess"
      guess = gets.chomp.to_i
      if guess == 0 || guess.to_s.length != 4
        until guess != 0 && guess.to_s.length == 4
          puts "The entered code was invalid \n Please input a 4 digit number"
          guess = gets.chomp.to_i
        end
      end
      no_of_attempts -= 1
    
      self.guess(guess.to_s)
      game.check_match(self.the_guess)
    
    
      p no_of_attempts
      p game.correct_number
      p game.matches
    end
  end
  
end