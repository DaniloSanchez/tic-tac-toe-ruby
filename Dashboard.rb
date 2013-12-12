require 'matrix'

class Dashboard

  def initialize
    @dashboard = Matrix[ [25, 93, 89], 
                         [-1, 66, 43],
                         [34, 53, 64]]
  end

  def print_dashboard
    @dashboard.each_slice(@dashboard.column_size) {|row| p row }
  end

end


i = Dashboard.new
i.print_dashboard
