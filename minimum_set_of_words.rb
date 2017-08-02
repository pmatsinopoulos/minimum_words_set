require 'set'

# Returns the set of letters in the the +words+ is an Array of strings
#
def letter_set_from_words(words)
  words = [words] if words.is_a?(String)

  Set.new words.map { |w| w.split('') }.flatten
end

# Returns the words of +words+ that do not contribute to letter set
# that includes the +new_word+. Note that only old words that
# have common part with the +new_word+ are being examined.
#
def without_words_not_contributing_to_letter_set(words, new_word)
  words_that_intersect_with_new_word = []
  words.each do |word|
    if letter_set_from_words(word).intersect?(letter_set_from_words(new_word))
      words_that_intersect_with_new_word << word
    end
  end

  words_that_intersect_with_new_word.each do |word|
    if letter_set_from_words(words.reject { |w| w == word } + [new_word]) >= letter_set_from_words(word)
      words.delete(word)
    end
  end
end

# This is recursive function. Given I know the `minimum_set_of_words(input)` then
# I am in position to calculate the `minimum_set_of_words(input + new_word)`, using
# the logic described in the README.md file
#
def minimum_set_of_words(input)
  return [] if input.nil? || input.size == 0
  return input if input.size == 1

  w = input[-1]     # take last word, that has just been added
  ww = input[0..-2] # take the words without last.

  w_letter_set = letter_set_from_words(w)
  ww_letter_set = letter_set_from_words(ww)

  if  w_letter_set <= ww_letter_set

    minimum_set_of_words(ww)

  elsif (w_letter_set & ww_letter_set < w_letter_set) && (w_letter_set & ww_letter_set).size >= 1

    temp = minimum_set_of_words(ww)
    without_words_not_contributing_to_letter_set(temp, w)
    temp + [w]

  else

    minimum_set_of_words(ww) + [w]

  end
end
