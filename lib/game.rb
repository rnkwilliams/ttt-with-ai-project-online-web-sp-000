class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O") , board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combination|
     if @board[win_combination[0]]=="X"&&
       @board[win_combination[1]]=="X"&&
       @board[win_combination[2]]=="X"
       return win_combination
     elsif @board[win_combination[0]]=="O"&&
       @board[win_combination[1]]=="O" &&
       @board[win_combination[2]]=="O"
       return win_combination
     end
   end
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end
end
