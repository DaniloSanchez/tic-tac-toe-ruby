class Validator

  attr_accessor :someone_won

  def initialize
    @someone_won = false
  end

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

  def there_is_a_winner?(dashboard)
    @someone_won = check_status(dashboard)
  end

  private

  def check_status(dashboard)
    check_status_by_player(dashboard,'_X_') ||
    check_status_by_player(dashboard,'_O_')
  end

  def check_status_by_player(dashboard,option)
    positions_to_win.any? do |element|
      (0..2).all? do |number|
        dashboard[element[number].first][element[number].last] == option
      end
    end
  end

end

