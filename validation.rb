class Validation

  def check_status(dashboard, player_one, player_two)
    check_rows(dashboard, player_one, player_two) ||
    check_columns(dashboard, player_one, player_two) ||
    check_diagonals(dashboard, player_one, player_two)
  end

  private

  def check_rows(dashboard, player_one, player_two)
    dashboard.map.any? do |row|
      row.all? { |elem| elem == player_two } ||
      row.all? { |elem| elem == player_one }
    end
  end

  def check_columns(dashboard, player_one, player_two)
    new_transpose_dashboard = transpose_dashboard(dashboard)
    result = check_rows(new_transpose_dashboard, player_one, player_two)
    result
  end

  def check_diagonals(dashboard, player_one, player_two )
    check_diagonal(dashboard, player_two) ||
    check_diagonal(dashboard, player_one) ||
    check_inverse_diagonal(dashboard, player_two) ||
    check_inverse_diagonal(dashboard, player_one)
  end

  def check_diagonal(dashboard, opcion_player)
    dashboard[0][0] == opcion_player &&
    dashboard[1][1] == opcion_player &&
    dashboard[2][2] == opcion_player
  end

  def check_inverse_diagonal(dashboard, opcion_player)
    dashboard[0][2] == opcion_player &&
    dashboard[1][1] == opcion_player &&
    dashboard[2][0] == opcion_player
  end

  def transpose_dashboard(dashboard)
    temporal_dashboard = [[],[],[]]
    transpose_dashboard_aux(dashboard, temporal_dashboard)
  end

  def transpose_dashboard_aux(dashboard, temporal_dashboard)
    dashboard.map do |row|
      temporal_dashboard.first << row.first
      temporal_dashboard[1] << row[1]
      temporal_dashboard.last << row.last
    end
    temporal_dashboard
  end

end
