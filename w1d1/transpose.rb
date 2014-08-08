def my_transpose(my_matrix)
  dimension = my_matrix.length
  new_matrix = Array.new(dimension) { Array.new(dimension)}
  dimension.times do |row_index|
    dimension.times do |col_index|
      new_matrix[col_index][row_index] = my_matrix[row_index][col_index]
    end
  end  
  
  new_matrix
end

p my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])