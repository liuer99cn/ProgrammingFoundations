def annual_percentage_rate(year)
  rate_number = case year
                  when (1..5)
                    0.0475/12
                  when (5..30)
                    0.049/12
                end
  rate_number
end


puts annual_percentage_rate(18)

