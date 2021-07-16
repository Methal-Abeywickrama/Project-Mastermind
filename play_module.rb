module Ply

  def play (game, player)
    no_of_attempts = 10
  
    until (game.correct_number == 4 && game.matches == 4) || no_of_attempts <= 0
      puts "#{@breaker_name}, you have #{no_of_attempts} attempts to crack the code."
      puts "enter your guess"
      if player == "human"
        guess = gets.chomp.to_i
      else
        guess = self.computer_plays(game.correct_number, game.matches)
      end
      if guess == 0 || guess.to_s.length != 4
        until guess != 0 && guess.to_s.length == 4
          puts "The entered code was invalid \n Please input a 4 digit number"
          if player == "human"
            guess = gets.chomp.to_i
          else
            guess = self.computer_plays(game.correct_number, game.matches)
          end
        end
      end
      no_of_attempts -= 1
    
      self.guess(guess.to_s)
      game.check_match(self.the_guess)
    
      puts "\n"
      puts "No: of attempts left #{no_of_attempts}"
      puts "#{game.correct_number} numbers were part of the code" 
      puts "#{game.matches} of those were also in the correct place" 
      puts "\n"
    end
    if game.matches == 4
      puts "#{@breaker_name}, you have successfully cracked the code"
    else
      puts "You #{@breaker_name}, have failed to crack the code"
    end
  end
  
end