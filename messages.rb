class Messages

  def message_welcome
   puts ""
   puts "Welcome to Tic Tac Toe"
  end

  def message_instructions
    puts "Player 1 -> X"
    puts "Player 2 -> O"
    puts "Player 1  starts the game"
  end

  def message_congratulations(player)
    puts "Congratulations #{player}, you win"
  end

  def message_draw
    puts "Game ended in a draw"
  end

  def message_invalid_movement
    puts "invalid movement, try again"
  end

  def message_put_row
    puts "now, select a number between 0 1 2 for the row"
  end

  def message_put_column
    puts "now, select a number between 0 1 2 for the column"
  end

  def message_next_player(player)
    puts "continue #{player}"
  end

end
