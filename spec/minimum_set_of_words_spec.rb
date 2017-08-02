require 'spec_helper'
require_relative '../minimum_set_of_words'

describe 'Minimum Set of Words' do
  [
      [['abcd'], ['abcd']],
      [['abcd', 'bc'], ['abcd']],
      [['abcd', 'bc', 'bce'], ['abcd', 'bce']],
      [['abcd', 'bcd', 'adx', 'by'], ['by', 'adx', 'abcd']],
      [['abcd', 'bcd', 'adx', 'by', 'cz'], ['cz', 'by', 'adx']],
      [['abcd', 'bcd', 'cd', 'xy', 'wz'], ['wz', 'xy', 'abcd']]
  ].each do |input, output|
    it "when (#{input.inspect}) then output (#{output})" do
      expect(minimum_set_of_words(input).sort).to eq(output.sort)
    end
  end
end
