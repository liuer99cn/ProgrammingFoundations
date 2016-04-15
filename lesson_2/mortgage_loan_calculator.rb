require 'yaml'
MESSAGES = YAML.load_file('mortgage_loan_calculator_messages.yml')

def equal_principal(amount, months, rate)
  d = amount.to_i * (rate.to_f * (1 + rate.to_f) ** months.to_i) / ((1 + rate.to_f) ** months.to_i - 1)
  e = (d * months.to_i - amount.to_i) / months.to_i
  prompt(MESSAGES['loan_output'] + "#{format('%02.2f', d)}")
  prompt(MESSAGES['interest_output'] + "#{format('%02.2f', e)}")
end

def principal_interest_equal(num1, num2, num3)
  a = num1.to_i
  m = num2.to_i
  r = num3.to_f

  loop do
    if m != 0
      monthly_loan2 = (a / m + a * r) / (1 + r)
      monthly_interest2 = a * r * (m / 2 + 0.5) / m
      prompt("Your #{m} month interest rate is : #{monthly_interest2.to_i}")
      prompt("Your loan in month #{m} is: #{monthly_loan2.to_i}")

      m -= 1
    else
      break
    end
  end
end

def prompt(message)
  puts "=>#{message}"
end

def loan_duration(number)
  number.to_i * 12
end

def valid_number?(input)
  !Integer(input).nil? rescue false
end

def annual_percentage_rate(year)
  rate_number = case year.to_i
                  when (1..5)
                    0.0475 / 12
                  when (5..30)
                    0.049 / 12
                end
  rate_number
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("please input your name!")
  else
    break
  end
end

prompt("Ok...#{name} ! Let's begin!")

loop do
  amount_loan = ''
  loop do
    prompt(MESSAGES['loan_input'])
    amount_loan = Kernel.gets().chomp()

    if valid_number?(amount_loan)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  years = ''
  loop do
    prompt(MESSAGES['loan_duration'])
    years = Kernel.gets().chomp()

    if valid_number?(years) && years.to_i <= 30
      break
    elsif years.to_i > 31
      prompt(MESSAGES['error_message'])
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  choice = ''
  loop do
    prompt(MESSAGES['method_message'])
    choice = Kernel.gets().chomp()

    if %w(1 2).include?(choice)
      break
    else
      prompt(MESSAGES['select_message'])
    end
  end

  result = case choice
             when '1'
               equal_principal(amount_loan, loan_duration(years), annual_percentage_rate(years))
             when '2'
               principal_interest_equal(amount_loan, loan_duration(years), annual_percentage_rate(years))
           end

  prompt(MESSAGES['perform_message'])

  user_input = Kernel.gets().chomp()
  break unless user_input.downcase().start_with?('y')
end
