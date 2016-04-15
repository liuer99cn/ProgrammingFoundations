# ask the user for two numbers
# ask the user for an operation to perform
# perform  the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)
require 'yaml'
#MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("==> #{message}")
end

def valid_number?(num)
  !Float(num).nil? rescue false
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(operation)
  word = case operation
           when '1'
             'Adding'
           when '2'
             'Subtracting'
           when '3'
             'Multiplying'
           when '4'
             'Dividing'
         end
  x = "A random line of code!"

  word
end

choice = ''
loop do
  prompt("please select your language/请选择你的语言:1)English 2)简体中文")
  choice = Kernel.gets().chomp()
  if %w(1 2).include?(choice)
    break
  else
    prompt("Please input the number 1 or 2/请输入数字1或2")
  end
end

MESSAGES = case choice
             when '1'
               YAML.load_file('calculator_messages.yml')
             when '2'
               YAML.load_file('calculator_messages_ch.yml')
           end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi..#{name}! " + MESSAGES['welcome_name'])

loop do
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['valid_operator'])
    end
  end
  prompt("#{operation_to_message(operator)} two numbers.....")

  result = case operator
             when '1'
               number1.to_f() + number2.to_f()
             when '2'
               number1.to_f() - number2.to_f()
             when '3'
               number1.to_f() * number2.to_f()
             when '4'
               number1.to_f() / number2.to_f()
           end

  prompt(MESSAGES['result'] + "#{result}")
  prompt(MESSAGES['perform_message'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['last_message'])