# arrangement format:
# => board = [1,2,3,4...]
# in which each index is a chess board's corresponding row
# and the value at that index is the column at which we place
# out precious Queen

def consistent?(board, n) # Check if the nth row is consistent with n-1 row before it
  for i in 0..(n-1)
    return false if board[i] == board[n] or                         # same col
                    (n - i).abs == (board[n] - board[i]).abs # same diagonal
  end
  true
end

def format_row(n, length) # print out the row with the Queen at nth cell
  template    = Array.new(length, :-)
  template[n] = "\u265B".intern # ♛ symbol
  template.join(' ')
end

def display_board(board, size = 8)
  puts '='*(size*2-1)
  board.each { |row| puts format_row(row,size) }
  puts '='*(size*2-1)
  puts
end

def arrange(board, solutions = [], r = 0)
  if r == board.size 
    solutions << Array.new(board)
  else
    for i in 0...board.size
      board[r] = i
      arrange(board, solutions, r+1) if consistent? board, r
    end
  end
  solutions
end

