# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #diagonal top left to bot right
  [6,4,2]] #diagonal bot left to top right

#display board method
# Define display_board that accepts a board and prints
# out the current state.

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your move method here!
def move(board, location, char = "X")
  board[location.to_i - 1] = char
  return board
end

# code your #valid_move? method here
def valid_move?(board, position)
  pos = position.to_i

  if !pos.between?(1,9) || position_taken?(board, pos - 1)
    false
  else
    true
  end
end


# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, position)
  if board[position] == " " || (board[position] == "" || board[position] == nil)
    false
    elsif board[position] == "X" || board[position] == "O"
    true
  end
end

#run a turn
def turn(board)
  puts "Please enter 1-9:"
  position = gets
  if !valid_move?(board, position)
    turn(board)
    else
    move(board, position)
    display_board(board)
  end
end

# is the game a draw?
def draw?(board)
  full?(board) && !won?(board)
end

# is the game over?
def over?(board)
  draw?(board) || won?(board)
end

# who is the winner?
def winner(board)
  if won?(board)
    return board[won?(board)[0]]

  end

end


#play method

def play(board)
  until over?(board) do
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
    puts "Cats game!"
  end

end
