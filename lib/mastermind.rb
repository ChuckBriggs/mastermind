# frozen_string_literal: true
#require 'pry'; binding.pry #rubocop:disable all

require_relative 'mastermind/version'
require_relative 'board'
require_relative 'code_breaker'
require_relative 'code_maker'
require_relative 'player'

include Mastermind

module Mastermind
  class Error < StandardError; end
  # Your code goes here...

  class Game
    def initialize
      @board = Board.new
      game_type = select_game_type
      if game_type == 1
        @code_maker = AICodeMaker.new
        @code_breaker = HumanCodeBreaker.new
      elsif game_type == 2
        @code_maker = HumanCodeMaker.new
        @code_breaker = AICodeBreaker.new
      end
      @turn_counter = 0
      @winner = false
    end

    def play
      while @turn_counter < 12 && @winner == false
        play_turn
      end
      if @winner == true
        winner_ending
      else
        loser_ending
      end
    end

    def print_stuff
      puts "stuff"
    end

    def select_game_type
      selection = 0
      until selection == 1 || selection == 2
        puts "\"1\" for AI code maker, human code breaker.\
            \n\"2\" for human code maker, AI code breaker.\
            \nSelect game type:"
        selection = gets.chomp.to_i
      end
      selection
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
      guess = @code_breaker.input_guess
      # add breaker's guess to board
#require 'pry'; binding.pry #rubocop:disable all
      @board.add_guess(guess)
      # get results of breaker's guess from maker
      results = @code_maker.check_guess(guess)
      # add results of breaker's guess to board
      @board.add_result(results)
      @code_breaker.learn(results)
      # display board
      @board.display
      # breaker's guess.winner?
      @winner = @code_maker.winner?(guess)
    end  
  end
end

game = Game.new
game.play