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

e = '___'
x = '_X_'
o = '_O_'

var = [[x,e,e],
       [e,x,e],
       [e,e,e]
      ]


test = Validation.new
p test.check_status(var, x)
p test.check_status(var, o)
