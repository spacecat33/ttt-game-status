# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant


WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Left Diagonal
  [6,4,2], # Right diagonal
] 

def won?(board)
WIN_COMBINATIONS.find do |element|
  win_index_1 = element[0]
  win_index_2 = element[1]
  win_index_3 = element[2]
  position_1 = board[win_index_1] # value of board at win_index_1
  position_2 = board[win_index_2] # value of board at win_index_2
  position_3 = board[win_index_3] # value of board at win_index_3
  if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
    return element # return the win_combination indexes that won 
elsif board.all? {|i| i == " "}
  return false 
end 
end
end

def full?(board)
board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else 
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true 
  end
end

def winner(board)
  if won?(board)
     return board[won?(board)[0]]
  end
end

