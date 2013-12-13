class Dashboard

  def initialize
    @machine = '_X_'
    @human = '_O_'
    @empty = '___'
    @dashboard = [ [@empty, @empty, @empty],
                   [@empty, @empty, @empty],
                   [@empty, @empty, @empty] ]
  end

  def print_dashboard
    @dashboard.each { |row| p row }
  end

  def position_is_valid?(position)
    @dashboard[position.first][position.last] == @empty
  end

  def do_movement(user, position)
    @dashboard[position.first][position.last] = (user ==  0 ? @machine : @human)
  end

  def movements_exist?
    @dashboard.any? { |elem| elem.any? { |cell| cell == @empty } }
  end

  def check_rows
    @dashboard.map.any? do |row| 
      row.all? { |elem| elem == @human } ||
      row.all? { |elem| elem == @machine }
    end
  end

  def check_columns
    transpose_dashboard
    result = check_rows
    transpose_dashboard
    result
  end

  def check_diagonal
    (@dashboard[0][0] && @dashboard[1][1] && @dashboard[2][2]) == @human ||
      (@dashboard[0][0] && @dashboard[1][1] && @dashboard[2][2]) == @machine
  end

  def check_inverse_diagonal

  end

  private

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


i = Dashboard.new
i.print_dashboard
#_pos = [1,1]
#i.do_movement(1,_pos) if i.position_is_valid?(_pos)
#i.print_dashboard
#i.movements_exist
p i.check_rows
p i.check_columns
i.print_dashboard
p i.check_diagona
l
