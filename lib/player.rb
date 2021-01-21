# frozen_string_literal: true
#require 'pry'; binding.pry #rubocop:disable all

module Mastermind
  # asdf class init comment
  class Player
#    def initialize
#      @name = 'poopstick'
#    end

    def input_code
      puts "enter code"
      code = gets.chomp.upcase.split('')
    end

    def compare_codes(arr1, arr2)
      arr1 = arr1.map { | x | x }
      arr2 = arr2.map { | x | x }
      results = { cows: 0, bulls: 0 }
      # Cownt the bulls
      results[:bulls] = count_bulls(arr1, arr2)
      # i = arr1.length
      # while i > 0 do
      #   i -= 1
      #   if arr2[i] == arr1[i]
      #     arr2.delete_at(i)
      #     arr1.delete_at(i)
      #     results[:bulls] += 1
      #   end
      # end
      # Cownt the cows
      results[:cows] = count_cows(arr1, arr2)
      # while arr1.any? do
      #   if arr2.include?(arr1.last)
      #     arr2.delete_at(arr2.find_index(arr1.last))
      #     results[:cows] += 1
      #   end
      #   arr1.pop
      # end
      results
    end

    def count_cows(arr1, arr2)
      matches = 0
      while arr1.any?
        if arr2.include?(arr1.last)
          arr2.delete_at(arr2.find_index(arr1.last))
          matches += 1
        end
        arr1.pop
      end
      matches
    end

    def count_bulls(arr1, arr2)
      matches = 0
      i = arr1.length
      while i > 0 do
        i -= 1
        if arr1[i] == arr2[i]
          arr1.delete_at(i)
          arr2.delete_at(i)
          matches += 1
        end
      end
      matches
    end

  end
end
