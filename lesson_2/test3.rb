VALID_CHOICE = {
    "r" => "rock",
    "p" => "paper",
    "s" => "scissors",
    "k" => "spock",
    "l" => "lizard"
}

def prompt(message)
  Kernel.puts("=> #{message}")
  Kernel.puts("--------------------------------------------")
end

def win?(player, computer)
  player == 'rock' && (computer == 'lizard'  or computer == 'scissors')||
  player == 'lizard' && (computer == 'spock' or computer == 'paper') ||
  player == 'spock' && (computer == 'rock' or computer == 'scissors') ||
  player == 'scissors' && (computer == 'lizard' or computer == 'paper') ||
  player == 'paper' && (computer == 'rock' or computer == 'spock')
end

def display_result(first, second)
  if win?(first, second)
    "You won!"
  elsif win?(second, first)
    "Computer won!"
  else
    "It's tie! No one won!"
  end
end

loop do # five times game play loop
  choice_value = ''
  choice = ''
  loop do # choice input loop
    welcome_message = <<MSG
  Welcome to play our big bang game!please select one:
  r) rock
  p) paper
  s) scissors
  k) spock
  l) lizard
MSG
    prompt(welcome_message)
    choice_value = Kernel.gets().chomp()
    if VALID_CHOICE.key?(choice_value)
      choice = VALID_CHOICE[choice_value]
      break
    else
      prompt("please input valid choice!")
    end
  end
  computer_choice = VALID_CHOICE.values.sample()
  prompt("Your choice is #{choice},and computer choice is #{computer_choice}")

  prompt(display_result(choice, computer_choice))
end

