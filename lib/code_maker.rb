# frozen_string_literal: true
#require 'pry'; binding.pry #rubocop:disable all
require_relative 'player'

module Mastermind
  # asdf class init comment
  class CodeMaker < Player
    def initialize
      @code = generate_random_code
      p @code
    end

    def generate_random_code
      random_code = Array.new(4)
      random_code.map { | x | x = rand(97..102).chr }
    end

    def check_guess(arr1)
      compare_codes(arr1, @code)
    end

    def winner?(arr)
      arr == @code
    end

    private

    attr_reader :code
  end
end