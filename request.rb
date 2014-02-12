class Request

  def name_player(player)
    puts "what is your name player #{player}"
    gets.chomp
  end

  def choose_a_quadrant
    choose_quadrant_message
    read_keyboard_for_a_number
  end

  def convert_to_pair(quadrant)
    [quadrant/3,quadrant%3]
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

end
