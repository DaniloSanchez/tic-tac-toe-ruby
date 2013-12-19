class Dashboard

  def initialize
    @player_one = '_X_'
    @player_two = '_O_'
    @empty = '___'
    @dashboard = [ [@empty, @empty, @empty],
                   [@empty, @empty, @empty],
                   [@empty, @empty, @empty] 
    ]
  end

  def print_dashboard
    puts ""
    @dashboard.each { |row| p row }
  end

  def position_is_valid?(position)
    @dashboard[position.first][position.last] == @empty
  end

  def do_movement(user, position)
    @dashboard[position.first][position.last] = (user.even? ? @player_one : @player_two)
  end

  def exist_movement?
    @dashboard.any? { |elem| elem.any? { |cell| cell == @empty } }
  end

end
