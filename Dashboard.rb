class Dashboard

  def initialize
    @machine = '_X_'
    @human = '_O_'
    @empty = '___'
    @dashboard = [ [@human, @human,  @human],
                   [@machine, @machine, @human],
                   [@human, @machine, @machine] ]
  end

  def print_dashboard
    @dashboard.each { |row| p row }
  end

  def position_is_valid?(position)
    @dashboard[position.first][position.last] == @empty
  end

  def do_movement(user, position)
    @dashboard[position.first][ position.last] = (user ==  0 ? @machine : @human)
  end

  def movements_exist?
    @dashboard.any? do
      |elem| elem.any? { |cell| cell == @empty }
    end
  end

  def row?
    @dashboard.map.any? do
      |row| row.all? { |elem| elem == @human } ||
        row.all? { |elem| elem == @machine }
    end
  end

  def column?
    transpose_dashboard
    result = row?
    transpose_dashboard
    result
  end

  private

  def transpose_dashboard
    temporal_dashboard = [[],[],[]]
    @dashboard.map do 
      |row| temporal_dashboard.first << row.first
        temporal_dashboard[1] << row[1]
        temporal_dashboard.last << row.last
    end
    @dashboard = temporal_dashboard
  end

end


i = Dashboard.new
i.print_dashboard
#_pos = [1,1]
#i.do_movement(1,_pos) if i.position_is_valid?(_pos)
#i.print_dashboard
#i.movements_exist
p i.row?
p i.column?
i.print_dashboard
