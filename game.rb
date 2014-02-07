require './display'
require './dashboard'
require './validator'

class Game

  attr_accessor :player, :name_player_one, :name_player_two

  def initialize
    @messages = Display.new
    @dashboard = Dashboard.new
    @validator = Validator.new
    @turn = 0
  end

  def start_game
    @messages.welcome
    @messages.instructions
    request_names
    start
  end

  private

  def start
    in_progress while !end_game
    congratulations
  end

  def end_game
    winner? || !@dashboard.exist_movement?
  end

  def winner?
    @validator.there_is_a_winner?(@dashboard.dashboard)
  end

  def in_progress
    next_turn
    read_keyboard_in_process
    @turn = @turn += 1
  end

  def next_turn
    @dashboard.print_dashboard
    @player = @turn.even? ? name_player_one : name_player_two
    @messages.next_player(player)
  end

  def read_keyboard_in_process
    position = @dashboard.request_position
    @dashboard.do_movement(@turn,position)
  end

  def congratulations
    @dashboard.print_dashboard
    if @validator.exists_winner
      @messages.congratulations(player)
    else
      @messages.draw_game?
    end
  end

  def request_names
    @messages.name_player(1)
    @name_player_one = gets.chomp
    @messages.name_player(2)
    @name_player_two = gets.chomp
  end

end
