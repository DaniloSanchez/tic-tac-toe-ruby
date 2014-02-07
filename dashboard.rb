require "./display"

class Dashboard

  attr_reader :dashboard

  def initialize
    @messages = Display.new
    @player_one = '_X_'
    @player_two = '_O_'
    @empty = '___'
    @dashboard = [
      [@empty, @empty, @empty],
      [@empty, @empty, @empty],
      [@empty, @empty, @empty] 
    ]
  end

  def print_dashboard
    @dashboard.each { |row| p row }
  end

  def is_free?(position)
    empty?(position) ? true : invalid_movement_not_free
  end

  def empty?(position)
    @dashboard[position[0]][position[1]] == @empty
  end

  def invalid_movement_not_free
    @messages.invalid_movement_quadrant_occupied
    false
  end

  def do_movement(user, position)
    @dashboard[position[0]][position[1]] =
      (user.even? ? @player_one : @player_two)
  end

  def exist_movement?
    @dashboard.any? { |elem| elem.any? { |cell| cell == @empty } }
  end

  def request_position
    quadrant = choose_a_quadrant
    pair = convert_to_pair(quadrant)
    is_free?(pair) ? pair : request_position
  end

  private

  def choose_a_quadrant
    @messages.choose_quadrant
    read_keyboard_for_a_number
  end

  def read_keyboard_for_a_number
    key = gets.chomp
    key =~ /^[0-8]$/ ? key.to_i : not_number
  end

  def not_number
    @messages.invalid_not_number
    read_keyboard_for_a_number
  end

  def convert_to_pair(quadrant)
    [quadrant/3,quadrant%3]
  end

end
