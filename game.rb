require './display'
require './dashboard'
require './validator'

class Game

  attr_accessor :player, :name_player_one, :name_player_two

  def initialize
    @display = Display.new
    @dashboard = Dashboard.new
    @validator = Validator.new
    @turn = 0
  end

  def start_game
    @display.welcome_message
    @display.instructions
    request_names
    start
  end

  private

  def start
    in_progress until end_game
    final_message
  end

  def end_game
    winner? || !@dashboard.exist_movement?
  end

  def winner?
    @validator.there_is_a_winner?(@dashboard.board)
  end

  def in_progress
    @display.print_board(@dashboard.board)
    next_turn
    get_position
    @turn = @turn += 1
  end

  def next_turn
    @player = @turn.even? ? name_player_one : name_player_two
    @display.next_player(player)
  end

  def get_position
    position = request_position
    @dashboard.do_movement(@turn%2,position)
  end

  def request_position
    quadrant = @display.choose_a_quadrant
    pair = @display.convert_to_pair(quadrant)
    @dashboard.available_position?(pair) ? pair : invalid_request
  end

  def invalid_request
    @display.quadrant_occupied
    request_position
  end

  def final_message
    @validator.exists_winner ? congratulations : draw
  end

  def congratulations
    @display.print_board(@dashboard.board)
    @display.congratulations(player)
  end

  def draw
    @display.print_board(@dashboard.board)
    @display.draw_game
  end

  def request_names
    @name_player_one = @display.name_player(1)
    @name_player_two = @display.name_player(2)
  end

end
