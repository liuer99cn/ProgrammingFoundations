arr1 = "The Flintstones Rock!"
i = 0
loop do
  arr1 = " " + arr1
  i += 1
  puts arr1
  break if i > 9
end

10.times {|number| puts (" " * number) + "The Flintstones is Rock!"}

statement = "The Flintstones Rock"
result1 = {}
statement.each_char {|i| result1[statement[i]] = statement.count(statement[i])}
result1.delete_if {|key, value| key == " "}

puts result1

a = 42
puts "the value of 40 + 2 is :#{a}"

def factors(number)
  dividend = number
  divisors = []
  if number > 0
    loop do
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
      break if dividend == 0
    end
    divisors
  elsif number < 0
    loop do
      divisors << number / dividend if number % dividend == 0
      dividend += 1
      break if dividend == 0
    end
    divisors
  else
    puts("0 can not be a divide number!")
    exit(0)
  end
end



p factors(10)



def fib(first_num, second_num)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
    p sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
}


munsters.each do |name, details|
  details["age_group"] = case details["age"]
                                   when (0..18)
                                     "kid"
                                   when (18..64)
                                     "adult"
                                   else
                                     "senior"
                                 end
end
p munsters





