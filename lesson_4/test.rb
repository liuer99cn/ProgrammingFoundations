def joinor(arr, symbol = ',', word = 'or')
  result_str = arr.join(symbol)
  num = result_str.length.to_i - 1
  insert_word = word + ' '

  result = result_str.insert(num, insert_word )
end

p joinor([1,2,3,5,6],';')

def joinor1(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

p joinor1([1,2,3,4],';')