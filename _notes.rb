# to compare guess to code (both arrays)
def check_guess(code, guess)
  results = { cows: 0, bulls: 0 }
  i = 4
  while i > 0 do
    i -= 1
    if code[i] == guess[i]
      code.delete_at(i)
      guess.delete_at(i)
      results[:bulls] += 1
    end
    # STILL NEED TO COWNT THE COWS
  end
  results
end

p check_guess(['a', 'b', 'c', 'd'], ['a', 'b', 'e', 'f'])





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
