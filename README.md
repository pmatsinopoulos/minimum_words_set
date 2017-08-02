Given a set of words ww, let's find the minimum set of words the letters of which comprise the whole
alphabet used for the whole words set.

For example, if words are:

- abcd
- bcd
- cd
- xy
- wz

Then, the minimum set of words is:

- wz
- xy
- abcd

We want to create a function F as follows: 

F: 

- input: ww, which is the whole set of words. Note. The whole set of words comprises the letters set L.
- output: r, which is a subset of ww that contains the minimum set of words from ww that have letters from the whole set L.
                     
`F(ww) => r`

# Algorithm

Given `F(ww) => r` can I calculate the `F(ww + w)`. Where `ww + w` is the previous set of words `ww` with a new word `w`?

`F(ww + w)`
  
## CASE #1
 
if `w` has all letters that belong to L (L being the letter set of `ww`)

then `F(ww + w) == F(ww)`

Is this the minimum?
The words are `ww + w`. If `F(ww)` is not the minimum set then this means that 
`w` adds some letters to the whole set, which is not the case.
   
## CASE #2
   
if `w` has some letters that belong to L and some that they do not belong to L

then `F(ww + w) => F(ww) + w - {the words from F(ww) that they do not contribute any new letter any more}`

Is this the minimum? If this is not the minimum then this means that I can remove
a word and I still have the same letter set. If I remove the `w`, then I don't have the
same letter set. If I remove any more of the other words in `F(ww)`, then that word means it has the
same letters like `w`, which is not the case. Hence, this is the minimum set.
   
## CASE #3
   
if `w` has all letters not being part of L

then `F(ww + w) => F(ww) + w`

Is this the minimum? If this is not the minimum, then I can remove a word and have the minimum
set. If I remove `w`, then I will not cover for the letters of `w`. If I remove any of the words
`F(ww)`, then the characters of this word are not covered by the newly added word `w`.

# Testing

You can run `bundle exec rspec`. This will execute all the test cases in [spec/minimum_set_of_words_spec.rb](spec/minimum_set_of_words_spec.rb).
You can add more cases to this file.
