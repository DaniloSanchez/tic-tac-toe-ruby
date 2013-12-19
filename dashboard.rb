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

  def get_dashboard
    @dashboard
  end

  def get_positions
    pos_x = position_row
    pos_y = position_column
    [pos_x.to_i, pos_y.to_i]
  end

  private

  def position_row
    puts "now, select a number between 0 1 2 for the row"
    gets.chomp
  end

  def position_column
    puts "now, select a number between 0 1 2 for the column"
    gets.chomp
  end

end
