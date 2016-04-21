def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
def uuid
  arr1 = []
  arr2 = []
  arr3 = []
  arr4 = []
  arr5 = []
  num = 0
  sample_arr = ('a'..'f').to_a + (0..9).to_a
  loop do
    arr1[num] = sample_arr.sample()
    num += 1
    break if num >7
  end

  num = 0
  loop do
    arr2[num] = sample_arr.sample()
    arr3[num] = sample_arr.sample()
    arr4[num] = sample_arr.sample()
    num += 1
    break if num >3
  end

  num = 0
  loop do
    arr5[num] = sample_arr.sample()
    num += 1
    break if num >11
  end

  p arr1.join('')+'-'+arr2.join('')+'-'+arr3.join('')+'-'+arr4.join('')+'-'+arr5.join('')
end
uuid

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
p generate_UUID

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_a_number?(word)
    end
  end