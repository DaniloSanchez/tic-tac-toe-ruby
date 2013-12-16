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
    @idashboard.print_dashboard
    start
  end

  def start
    turn = 0
    player = ''
    while @idashboard.movements_exist? == true || @idashboard.check_status == false
      player = turn.even? ? "Player 1" : "Player 2"
      in_process(player)
      turn = turn += 1
    end
    congratulations(player)
  end

  def in_process(player)
    @idashboard.print_dashboard
    @imessages.message_next_player(player)
    loop do
      pos_x = position_row
      pos_y = position_column
      break unless @idashboard.do_movement(player, [pos_x, pos_y]) if @idashboard.position_is_valid?([pos_x,_pox_y])
    end
  end

  def position_row
    @imessages.message_put_row
    gets.chomp
  end

  def position_column
    @imessages.message_put_column
    gets.chomp
  end

  def congratulations(player)
    @idashboard.check_status ? @imessages.message_congratulations(player) : @imessages.message_draw
  end

end

game = Brain.new
game.strat_game
