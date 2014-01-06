require './messages'
require './dashboard'
require './validator'

class Game

  def initialize
    @messages = Messages.new
    @dashboard = Dashboard.new
    @validator = Validator.new
    @turn = 0
    @player, @name_player_one, @name_player_two = ''
  end

  def start_game
    @messages.message_welcome
    @messages.message_instructions
    request_names
    start
  end

  private

  def start
    while @dashboard.exist_movement?
      in_progress
      break if @validator.there_is_a_winner?(@dashboard.dashboard)
    end
    congratulations
  end

  def in_progress
    next_turn
    read_keyboard_in_process
    @turn = @turn += 1
  end

  def next_turn
    @dashboard.print_dashboard
    @player = @turn.even? ? @name_player_one : @name_player_two
    @messages.message_next_player(@player)
  end

  def read_keyboard_in_process
    position = @dashboard.request_position
    until @dashboard.is_valid?(position)
      position = @dashboard.request_position
    end
    @dashboard.do_movement(@turn,position)
  end

  def congratulations
    @dashboard.print_dashboard
    if @validator.someone_won
      @messages.message_congratulations(@player)
    else
      @messages.message_draw
    end
  end

  def request_names
    @messages.message_name_player_one
    @name_player_one = gets.chomp
    @messages.message_name_player_two
    @name_player_two = gets.chomp
  end

end
