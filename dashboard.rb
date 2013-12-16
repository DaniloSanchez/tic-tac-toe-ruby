class Dashboard

  def initialize
    @player_one = '_X_'
    @player_two = '_O_'
    @empty = '___'
    @dashboard = [ [@empty, @empty, @empty],
                   [@empty, @empty, @empty],
                   [@empty, @empty, @empty] ]
  end

  def print_dashboard
    puts ""
    @dashboard.each { |row| p row }
  end

  def check_status
    check_rows || check_columns || check_diagonals
  end

  def position_is_valid?(position)
    @dashboard[position.first][position.last] == @empty
  end

  def do_movement(user, position)
    @dashboard[position.first][position.last] = (user ==  0 ? @player_one : @player_two)
  end

  def movements_exist?
    @dashboard.any? { |elem| elem.any? { |cell| cell == @empty } }
  end

  def check_rows
    @dashboard.map.any? do |row| 
      row.all? { |elem| elem == @player_two } ||
      row.all? { |elem| elem == @player_one }
    end
  end

  def check_columns
    transpose_dashboard
    result = check_rows
    transpose_dashboard
    result
  end

  def check_diagonals
    check_diagonal(@player_two) ||
    check_diagonal(@player_one) ||
    check_inverse_diagonal(@player_two) ||
    check_inverse_diagonal(@player_one)
  end

  private

  def check_diagonal(opcion)
    @dashboard[0][0] == opcion &&
    @dashboard[1][1] == opcion &&
    @dashboard[2][2] == opcion
  end

  def check_inverse_diagonal(opcion)
    @dashboard[0][2] == opcion &&
    @dashboard[1][1] == opcion &&
    @dashboard[2][0] == opcion
  end

  def transpose_dashboard
    temporal_dashboard = [[],[],[]]
    @dashboard = transpose_dashboard_aux(temporal_dashboard)
  end

  def transpose_dashboard_aux(temporal_dashboard)
    @dashboard.map do |row|
      temporal_dashboard.first << row.first
      temporal_dashboard[1] << row[1]
      temporal_dashboard.last << row.last
    end
    temporal_dashboard
  end

end
