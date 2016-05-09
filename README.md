Local Variables

1.In Ruby, variable scope is defined by a block.Inner scope can access variables initialized in an outer scope, but not vice versa.So the value of `str` is 2. This is because `str` is available to the inner scope created by `loop do ... end`, which allowed the code to re-assign the value of `str`. 

2.This is because the variable `str` is not available outside of the `loop do...end` block in which it is initialized. When we call puts `str` it is not available within that outer scope.

3.If the variable of `str` is initialized before the `loop do...end` block, the code snippet will run, it will be allowed the code to re-assign the value of `str`.
If the opposite of it, the code will raises an exception.

4.The method of `a_method` create their own scope that's entirely outside of the execution flow. the variable of `str` in `a_method` does not definition,so the code raises an exception:`in 'a_method': undefined local variable or method 'str' for main:Object (NameError)` .

5.There is one variable called `str`(A) in the first line, A a local variable outside the definition of the method `a_method`. 
The method called `a_method`, which has one variable called `str`(B). The variable is local. This means that it is valid only within the method definition. We can refer to the B only between the method name and the end keyword.
So A and B is totally different variable, although they have same name.
And they have different scope, they don't share the same scope.

6.The line of code `b = a` means `b = "hello"`,that the code `a = "hi"` reassigned the variable a to a completely different address in memory; it's now pointing to an entirely new string. 
The line of code `a << " world"` did not result in reassigning a to a new string. Rather, it mutated the caller and modified the existing string, and now `a = "hi world"`, the variable b does not change.

7.I find the methods called `defined?`,and running in `irb`,the variables of `a,b,c,d` are local variables，and there are four objects(string).

Mutating Method Arguments

1.The line of code `param + " world"` will be to a new string, so variable `param` in the method `change` does not change.
So the values of local variable `greeting` does not change after running line 6.

2.The line of code `param << " world"` did not result in reassigning param to a new string. Rather, it mutated the caller and modified the existing string, so the method will return the value to variable `greeting`, it wiil be "hello world".

3.The line of code `param = "hi"` reassigned the variable param to a completely different address in memory,the line of code `param << " world"` did not result in reassigning param to a new string.
So the method of change  will always return "hello world",and the variable greeting is "hello".

4.The variable greeting is "hello",the first line of method `param += "greeting"` will be "hellogreeting",that the code `param += "greeting"` reassigned the variable param to a completely different address in memory; it's now pointing to an entirely new string,so the variable greeting does not change. 
The second line of method `param << "hey"` did not result in reassigning param to a new string. Rather, it mutated the caller and modified the existing string, it will be "hellogreetinghey".
The third line `param = "hi"` reassigned the variable param to a completely different address in memory; it's now pointing to an entirely new string,so param is "hi" now.
The last line of method `param << " world"` did not result in reassigning param to a new string. Rather, it mutated the caller and modified the existing string, so it will be "hi world".
Method change will return "hi world", and the variable greeting is always be "hello".

Working with Collections

1.The `map` method takes an enumerable object and a block, and runs the block for each element, outputting each returned value from the block (the original object is unchanged): `[1, 2, 3].map { |n| n * n } #=> [1, 4, 9]` `map` with a block returns an Array.
`map` creates a new array consisting of the returned value of the block, let's see an example with map and puts:
```a = [1, 2, 3]
a.map { |x| puts x**2 }
=> [nil, nil, nil]```
Because puts returns nil every time the block is invoked nil is returned which makes up the values in the newly created returned array.

2.When all you're doing is pulling out, or selecting, certain items based on some criteria, you'd be better served using Enumerable's `select` instead. It will run the block on every item of your object (whether array or hash or whatever) and return a new object that contains only those items for which the original block returned true:
``` array = [1,2,3,4,5,6,7,8,100]
array.select{|item| item%2==0 }
=> [2,4,6,8,100] ```

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





