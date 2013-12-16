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

  def message_options_menu
  end

  def message_game_mode
  end

  def message_options_game
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

  def message_next_player(player)
    puts "continue #{player}"
  end

  def message_quit
  end

  def message_restart
  end

  def message_pause
  end

  def message_about
  end

end
