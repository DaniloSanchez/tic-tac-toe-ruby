class Validator

  attr_accessor :exists_winner

  def initialize
    @exists_winner = false
  end

  def there_is_a_winner?(dashboard)
    @exists_winner = check_status(dashboard)
  end

  private

  def positions_to_win
    [[[0,0],[0,1],[0,2]],
     [[1,0],[1,1],[1,2]],
     [[2,0],[2,1],[2,2]],
     [[0,0],[1,0],[2,0]],
     [[0,1],[1,1],[2,1]],
     [[0,2],[1,2],[2,2]],
     [[0,0],[1,1],[2,2]],
     [[0,2],[1,1],[2,0]]
    ]
  end

  def check_status(dashboard)
    check_status_by_player(dashboard,1) ||
    check_status_by_player(dashboard,0)
  end

  def check_status_by_player(dashboard,option)
    positions_to_win.any? do |element|
      (0..2).all? do |number|
        dashboard[element[number].first][element[number].last] == option
      end
    end
  end

end
