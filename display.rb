class Display

  def welcome_message
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

  def draw_game
    puts "Game ended in a draw"
  end

  def quadrant_occupied
    puts "Quadrant occupied, try again"
  end

  def convert_to_pair(quadrant)
    [quadrant/3,quadrant%3]
  end

  def next_player(player)
    puts "continue #{player}"
  end

  def name_player(player)
    puts "what is your name player #{player}"
    gets.chomp
  end

  def choose_a_quadrant
    choose_quadrant_message
    read_keyboard_for_a_number
  end

  def print_board(board)
    temporal_board=[[],[],[]]
    new_board = board_to_display(temporal_board,board)
    show_board(new_board)
  end

  private

  def choose_quadrant_message
    puts "\nChoose a quadrant of the board"
    puts "| 0 | 1 | 2 |\n| 3 | 4 | 5 |\n| 6 | 7 | 8 |\n"
  end

  def read_keyboard_for_a_number
    key = gets.chomp
    key =~ /^[0-8]$/ ? key.to_i : not_number
  end

  def not_number
    invalid_not_number
    read_keyboard_for_a_number
  end

  def invalid_not_number
    puts "this is not a number between 0-8, try again"
  end

  def board_to_display(temporal_board,board)
    (0..2).each do |row|
      (0..2).each do |column|
        temporal_board[row][column] = get_cell(board[row][column])
      end
    end
    temporal_board
  end

  def get_cell(element)
    case element
    when 0 then "_X_"
    when 1 then "_O_"
    else "___"
    end
  end

  def show_board(board)
    board.each { |row| p row  }
  end

end
