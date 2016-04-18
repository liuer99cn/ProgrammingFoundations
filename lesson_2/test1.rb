def annual_percentage_rate(year)
  rate_number = case year
                  when (1..5)
                    0.0475/12
                  when (5..30)
                    0.049/12
                end
  rate_number
end


def test(b)
  p b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
p a