load 'messages.rb'
load 'dashboard.rb'

class Brain

  def initialize
    @messages = Messages.new
    @dashboard = Dashboard.new
  end

  def strat_game
    @messages.message_welcome
    @messages.message_instructions
    @dashboard.print_dashboard
    start
  end

  def start
  end

end


game = Brain.new
game.strat_game
