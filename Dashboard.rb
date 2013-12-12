class Dashboard

  def initialize
    @machine = '_X_'
    @human = '_O_'
    @empty = '___'
    @dashboard =[ [@empty, @empty, @empty],
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
    @dashboard[position.first][ position.last] = (user ==  0 ? @machine : @human)
  end

end


i = Dashboard.new
i.print_dashboard
_pos = [1,1]
i.do_movement(1,_pos) if i.position_is_valid?(_pos)
i.print_dashboard
