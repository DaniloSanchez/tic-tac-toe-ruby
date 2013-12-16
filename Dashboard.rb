class Dashboard

  def initialize
    @machine = '_X_'
    @human = '_O_'
    @empty = '___'
    @dashboard = [ [@machine, @empty, @machine],
                   [@empty, @machine, @empty],
                   [@human, @human, @human] ]
  end

  def print_dashboard
    @dashboard.each { |row| p row }
  end

  def check_status
    check_rows || check_columns || check_diagonals
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

  def check_diagonals
    check_diagonal(@human) ||
    check_diagonal(@machine) ||
    check_inverse_diagonal(@human) ||
    check_inverse_diagonal(@machine)
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


i = Dashboard.new
i.print_dashboard
#_pos = [1,1]
#i.do_movement(1,_pos) if i.position_is_valid?(_pos)
p i.check_status
i.print_dashboard
