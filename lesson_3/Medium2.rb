munsters1 = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" }
}

total_age = 0

munsters1.each do |name, detail|
    if detail["gender"]== "male"
      total_age += detail["age"]
    end
  end

p total_age

munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, detail|
  Kernel.puts("#{name} is a #{detail["age"]} years old #{detail["gender"]}")
end

def tricky_method(a_string_param, an_array_param)
  an_array_param << "rutabaga"
  a_string_param << "rutabaga"
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

sentence = "Humpty Dumpty sat on a wall."
words = sentence.split(/\W/)
p words
words.reverse!
backwards_sentence = words.join(' ') + '.'
p backwards_sentence

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

def made_of_good(some_number)
    some_number -= 20
end

p mess_with_it(answer)
p answer
new_answer = mess_with_it(answer)

p answer - 8

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

puts munsters

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "winner is paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "winner is scissors" : "paper"
  else
    (fist2 == "rock") ? "winner is rock" : "scissors"
  end
end
p rps("rock", "paper")
p rps("rock", "scissors")
p rps("paper", "rock")


puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")


def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
p foo
p bar
 p bar(foo)
