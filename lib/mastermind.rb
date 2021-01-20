require_relative 'mastermind/version'
require_relative 'board'
require_relative 'code_breaker'
require_relative 'code_maker'
require_relative 'player'

include Mastermind

module Mastermind
  class Error < StandardError; end
  # Your code goes here...

  def new_game
    @board = Board.new
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
    @turn_counter = 0
    @winner = false
    while @turn_counter < 12 && @winner == false
      play_turn
    end
    if @winner == true
      winner_ending
    else
      loser_ending
    end
  end

  def winner_ending
    puts "You didn't lose this time."
  end

  def loser_ending
    puts 'You lose, dummy.'
  end

  def play_turn
    @turn_counter += 1
    # get breaker's guess
    guess = @code_breaker.input_code
    # add breaker's guess to board
    @board.add_guess(guess)
    # get results of breaker's guess from maker
    results = @code_maker.check_guess(guess)
    # add results of breaker's guess to board
    @board.add_result(results)
    # display board
    @board.display
    # breaker's guess.winner?
    @winner = @code_maker.winner?(guess)
  end
end

new_game
