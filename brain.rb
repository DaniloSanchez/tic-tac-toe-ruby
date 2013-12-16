load 'messages.rb'
load 'dashboard.rb'

class Brain

  def initialize
    @imessages = Messages.new
    @idashboard = Dashboard.new
  end

  def strat_game
    @imessages.message_welcome
    @imessages.message_instructions
    @turn = 0
    @player = ''
    start
  end

  def start
    while @idashboard.movements_exist? == true && @idashboard.check_status == false
      in_process
    end
    congratulations
  end

  def in_process
    @player = @turn.even? ? "Player 1" : "Player 2"
    print_dashboard_and_next_player
    in_process_auxiliar
    @turn = @turn += 1
  end

  def in_process_auxiliar
    loop do
    pos = get_positions
    break @idashboard.do_movement(@player, pos) if @idashboard.position_is_valid?(pos)
      @imessages.message_invalid_movement
    end
  end

  def get_positions
    pos_x = position_row
    pos_y = position_column
    [pos_x.to_i, pos_y.to_i]
  end


  def print_dashboard_and_next_player
    @idashboard.print_dashboard
    @imessages.message_next_player(@player)
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
    @idashboard.check_status ? @imessages.message_congratulations(@player) : @imessages.message_draw
  end

end

game = Brain.new
game.strat_game
