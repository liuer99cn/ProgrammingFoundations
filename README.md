3.the `n` in `[1, 2, 3].map {|n| n + 1}` will not change.
`map` creates a new array consisting of the returned value of the block,so `n+= 1` is not safe if you don't know what's will be return.
I prefer the first`[1, 2, 3].map {|n| n + 1}`.

4.Because the `map` methods will return an array of values returned by the block.The code of 
```arr = [1, 2, 3].map do |n|
    n > 2
   end```
means every elements in `arr` greater than 2 is true or false.So the return values is `[false, false, true]`

5.The `puts` methods will return `nil` everytime after be called.The `map` methods will return an array of values returned by the block.So `arr` will be `[nil, nil, nil]`.

6.The select method will return the actual values being iterated over if the block evaluates to true. and in the code of:
```arr = [1, 2, 3].select do |n|
    n + 2
  end
  p arr```
and the condition of block is `n+2` is always will return true, so `arr`will be `[1, 2, 3]` .

7.the code of the question will output `1 2 3 []`,and `arr` will be `[]`, the line of `puts n` will return `nil`,and that's means `false` in ruby,the select method will return the actual values being iterated over if the block evaluates to true.
So everytime return `nil` means `false`, and every elements in `arr` don't meet the condition of it, at last `arr` is `[]`. 
