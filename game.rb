require './messages'
require './dashboard'
require './validation'

class Game

  def initialize
    @imessages = Messages.new
    @idashboard = Dashboard.new
    @ivalidation = Validation.new
    @turn = 0
    @player, @name_player_one, @name_player_two = ''
  end

  def start_game
    @imessages.message_welcome
    @imessages.message_instructions
    set_names
    start
  end

  private

  def start
    while @idashboard.exist_movement? == true
      in_process
      break if @ivalidation.check_status(@idashboard.get_dashboard)
    end
    congratulations
  end

  def in_process
    print_dashboard_and_next_player
    read_keyboard_in_process
    @turn = @turn += 1
  end

  def print_dashboard_and_next_player
    @player = @turn.even? ? @name_player_one : @name_player_two
    @idashboard.print_dashboard
    @imessages.message_next_player(@player)
  end

  def read_keyboard_in_process
    loop do
      pos = @idashboard.get_positions
      if @idashboard.position_is_valid?(pos)
        @idashboard.do_movement(@turn,pos)
        break
      else
        @imessages.message_invalid_movement
      end
    end
  end

  def congratulations
    @idashboard.print_dashboard
    if @ivalidation.check_status(@idashboard.get_dashboard)
      @imessages.message_congratulations(@player)
    else
      @imessages.message_draw
    end
  end

  def set_names
    @imessages.message_name_player_one
    @name_player_one = gets.chomp
    @imessages.message_name_player_two
    @name_player_two = gets.chomp
  end

end
