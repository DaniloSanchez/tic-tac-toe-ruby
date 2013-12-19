class Validation

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

  def check_status(dashboard, option)
    positions_to_win.any? do |element|
      (0..2).all? do |number|
        dashboard[element[number].first][element[number].last] == option
      end
    end
  end

end
