class Dashboard

  attr_accessor :dashboard

  def initialize
    @player_one = '_X_'
    @player_two = '_O_'
    @empty = '___'
    @dashboard = [ 
                 [@empty, @empty, @empty],
                 [@empty, @empty, @empty],
                 [@empty, @empty, @empty] 
    ]
  end

  def print_dashboard
    @dashboard.each { |row| p row }
  end

  def is_valid?(position)
    @dashboard[position.first][position.last] == @empty ? 
      true : invalid_movement_not_free
  rescue
    invalid_movement_not_free
  end

  def invalid_movement_not_free
    puts "invalid movement, try again"
    false
  end

  def do_movement(user, position)
    @dashboard[position.first][position.last] = 
      (user.even? ? @player_one : @player_two)
  end

  def exist_movement?
    @dashboard.any? { |elem| elem.any? { |cell| cell == @empty } }
  end

  def request_position
    quadrant = choose_a_quadrant
    quadrant=="" ? request_position : convert_to_pair(quadrant)
  end

  private

  def choose_a_quadrant
    puts "\nChoose a quadrant of the board"
    puts "| 0 | 1 | 2 |\n| 3 | 4 | 5 |\n| 6 | 7 | 8 |\n"
    gets.chomp
  end

  def convert_to_pair(quadrant)
    puts quadrant
    case quadrant.to_i
    when 0 then [0,0]
    when 1 then [0,1]
    when 2 then [0,2]
    when 3 then [1,0]
    when 4 then [1,1]
    when 5 then [1,2]
    when 6 then [2,0]
    when 7 then [2,1]
    when 8 then [2,2]
    else [9,9]
    end
  end

end
