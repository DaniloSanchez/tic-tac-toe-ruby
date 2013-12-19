load 'messages.rb'
load 'dashboard.rb'
load 'validation.rb'

class Brain

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
    while (@idashboard.exist_movement? && !@idashboard.check_status) == true
      in_process
    end
    congratulations
  end

  def in_process
    @player = @turn.even? ? @name_player_one : @name_player_two
    print_dashboard_and_next_player
    read_keyboard_in_process
    @turn = @turn += 1
  end

  def print_dashboard_and_next_player
    @idashboard.print_dashboard
    @imessages.message_next_player(@player)
  end

  def read_keyboard_in_process
    loop do
      pos = get_positions
      if @idashboard.position_is_valid?(pos)
        @idashboard.do_movement(@turn,pos)
        break
      else
        @imessages.message_invalid_movement
      end
    end
  end

  def get_positions
    pos_x = position_row
    pos_y = position_column
    [pos_x.to_i, pos_y.to_i]
  end

  def position_row
    @imessages.message_put_row
    gets.chomp
  end

  def position_column
    @imessages.message_put_column
    gets.chomp
  end

  def congratulations
    @idashboard.print_dashboard
    if @idashboard.exist_movement?
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

game = Brain.new
game.start_game
