class Display

  def welcome
   puts ""
   puts "Welcome to Tic Tac Toe"
  end

  def instructions
    puts "Player 1 -> X"
    puts "Player 2 -> O"
    puts "Player 1  starts the game"
  end

  def congratulations(player)
    puts "Congratulations #{player}, you win"
  end

  def draw_game?
    puts "Game ended in a draw"
  end

  def invalid_movement_quadrant_occupied
    puts "invalid movement, quadrant occupied, try again"
  end

  def invalid_not_number
    puts "this is not a number between 0-8, try again"
  end

  def next_player(player)
    puts "continue #{player}"
  end

  def name_player(player)
    puts "what is your name player #{player}"
  end

  def choose_quadrant
    puts "\nChoose a quadrant of the board"
    puts "| 0 | 1 | 2 |\n| 3 | 4 | 5 |\n| 6 | 7 | 8 |\n"
  end

end
