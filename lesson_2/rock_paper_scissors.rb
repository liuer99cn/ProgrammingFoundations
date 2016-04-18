def test_method
  prompt('test message')
end

VALID_CHOICE = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
      (first == 'paper' && second == 'rock') ||
      (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    'You won!'
  elsif win?(computer, player)
    'Computer won!'
  else
    "It's a tie!"
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICE.join(',')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICE.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICE.sample()

  Kernel.puts("Your choice:#{choice}, and computer choice is #{computer_choice}")

  p display_results(choice, computer_choice)

  prompt("Do you want play again?(Y for play again!)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for your playing!Good Bye!")
