VALID_CHOICE = {
    "r" => "rock",
    "p" => "paper",
    "s" => "scissors",
    "k" => "spock",
    "l" => "lizard"
}.freeze()

def prompt(message)
  Kernel.puts("=> #{message}")
  Kernel.puts("--------------------------------------------")
end

def win?(player, computer)
  (player == 'rock' && %w(lizard scissors).include?(computer)) ||
      (player == 'lizard' && (computer == VALID_CHOICE['k'] || VALID_CHOICE['p'])) ||
      (player == 'spock' && (computer == VALID_CHOICE['r'] || VALID_CHOICE['s'])) ||
      (player == 'scissors' && (computer == VALID_CHOICE['l'] || VALID_CHOICE['p'])) ||
      (player == 'paper' && (computer == VALID_CHOICE['r'] || VALID_CHOICE['k']))
end

def display_result(first, second)
  if win?(first, second)
    prompt("You won!")
  elsif win?(second, first)
    prompt("Computer won!")
  else
    prompt("It's tie! No one won!")
  end
end

loop do # main loop
  player_score = 0
  computer_score = 0

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
      if VALID_CHOICE.key?(choice_value.downcase)
        choice = VALID_CHOICE[choice_value.downcase]
        break
      else
        prompt("please input valid choice!")
      end
    end

    computer_choice = VALID_CHOICE.values.sample()
    prompt("Your choice is #{choice},and computer choice is #{computer_choice}")

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    else
      prompt("Hard game!")
    end

    display_result(choice, computer_choice)
    prompt("Your score is: #{player_score},Computer score is: #{computer_score}")

    break if player_score > 4 || computer_score > 4
  end

  if player_score > computer_score
    prompt("O.H...!Great! you won!! Your score is #{player_score},computer score is #{computer_score}")
  elsif player_score < computer_score
    prompt("You lose the game!Your score is #{player_score},computer score is #{computer_score}")
  end

  prompt("Do you want play again?(Y for play again!)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end
