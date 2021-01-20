# frozen_string_literal: true
#require 'pry'; binding.pry #rubocop:disable all

# asdf class init comment
module Mastermind
  class Board
    def initialize
      @turn_results = []
    end

    def add_guess(arr)
      @turn_results[@turn_results.length] = { guess: arr, result: [] }
    end

    def add_result(hash)
      hash[:bulls].times {@turn_results.last[:result].push("\u263B")}
      hash[:cows].times {@turn_results.last[:result].push("\u263A")}
    end

    def display
      @turn_results.each_with_index do | x, i |
        puts "Turn ##{i+1}  \tGuess: #{x[:guess].join(' ')}    Result: #{x[:result].join(' ')}"
      end
    end
  end
end