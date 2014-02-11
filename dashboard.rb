class Dashboard

  attr_reader :board

  def initialize
    @board = [
      [nil,nil,nil],
      [nil,nil,nil],
      [nil,nil,nil]
    ]
  end

  def available_position?(position)
    @board[position[0]][position[1]].nil?
  end

  def do_movement(user, position)
   @board[position[0]][position[1]] = user
  end

  def exist_movement?
    @board.flatten.include?(nil)
  end

end
