# frozen_string_literal: true
#require 'pry'; binding.pry #rubocop:disable all
require_relative 'player'

# asdf class init comment
module Mastermind
  class CodeBreaker < Player
    def input_guess
      puts "Enter guess:"
      input_code
    end

    def learn(results)
      p results
    end
  end

  class AICodeBreaker < CodeBreaker
    def initialize
      @possible_solutions = Array.new
      %w(A B C D E F).each do |a|
        %w(A B C D E F).each do |b|
          %w(A B C D E F).each do |c|
            %w(A B C D E F).each do |d|
              @possible_solutions.push([a, b, c, d])
            end
          end
        end
      end
      @possible_solutions = @possible_solutions.shuffle
    end

    def input_code
      puts @possible_solutions.first.join
      @possible_solutions.first
    end

    def learn(results)
      temp = @possible_solutions.select { |x| compare_codes(x, @possible_solutions.first) == results }
      @possible_solutions = temp
    end
  end

  class HumanCodeBreaker < CodeBreaker
    def initialize
    end
  end  
end