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
    in_process_auxiliar
    @turn = @turn += 1
  end


  def in_process_auxiliar
    @idashboard.print_dashboard
    @imessages.message_next_player(@player)
    loop do
      pos_x = position_row
      pos_y = position_column
      break @idashboard.do_movement(@player, [pos_x.to_i, pos_y.to_i]) if @idashboard.position_is_valid?([pos_x.to_i,pos_y.to_i])
      @imessages.message_invalid_movement
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

  def congratulations
    @idashboard.print_dashboard
    @idashboard.check_status ? @imessages.message_congratulations(@player) : @imessages.message_draw
  end

end

game = Brain.new
game.strat_game

