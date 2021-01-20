# to compare guess to code (both arrays)
#require 'pry'; binding.pry #rubocop:disable all
def check_guess(code, guess)
  results = { cows: 0, bulls: 0 }
  # Cownt the bulls
  i = guess.length
  while i > 0 do
    i -= 1
    if code[i] == guess[i]
      code.delete_at(i)
      guess.delete_at(i)
      results[:bulls] += 1
    end
  end
  # Cownt the cows
  while guess.any? do
    if code.include?(guess.last)
      code.delete_at(code.find_index(guess.last))
      results[:cows] += 1
    end
    guess.pop
  end
  results
end
p check_guess(%w(a b c d e h), %w(a b d c g h))





# nouns: 
#
# board - stores breaker's guesses, tracks turn count
#
# code maker - generates code. checks guesses against code and gives results
#
# code breaker - makes guesses
#
# turn? maybe? can have things like guess array and results hash be instance variables. might make passing them around easier. might not.
#
# game? could take turn count. 'while turn_count < 12, Turn.new'

# def check_guess(code, guess)
#   results = { cows: 0, bulls: 0 }
#   i = guess.length
#   while i > 0 do
#     i -= 1
#     if code[i] == guess[i]
#       code.delete_at(i)
#       guess.delete_at(i)
#       results[:bulls] += 1
#     end
#     puts "code"
#     p code
#     puts "guess"
#     p guess
#     # STILL NEED TO COWNT THE COWS
#   end
#   results
# end

# def check_guess(code, guess)
#   results = { cows: 0, bulls: 0 }
#   # Cownt the bulls
#   guess.each_with_index do |x, i|
#     if x == code[i]
#       results[:bulls] += 1
#     end
#   end
#   # Cownt the cows
#   while guess.any? do
#     if code.include?(guess.last)
#       puts guess.last
#       code.delete_at(code.find_index(guess.last))
#       results[:cows] += 1
#     end
#     guess.pop
#   end
#   results[:cows] -= results[:bulls]
#   results
# end

