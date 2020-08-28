class TicTacToe

  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [2,4,6]]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    string.to_i - 1
  end

  def move(index, piece)
    @board[index] = piece
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count { |spaces| spaces != " " }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    current_player = player
   puts "Player #{player} please enter a number 1-9:"
   input = gets.chomp
   index = input_to_index(input)
   if valid_move?(index)
     move(index, player)
   else
     puts "That is an invalid move. Please try again."
     gets.chomp
   end
   display_board
  end
end
