VALID_CHOICE = %w(rock paper scissors spock lizard)
VALID_CHOICE_CHR = %w(r p s l )



def prompt(message)
  Kernel.puts("=> #{message}")
end

def rock_win?(rock)
  win_status = case rock
                 when 'scissors', 'lizard'
                   'You won!'
                 when 'spock', 'paper'
                   "Computer won!"
                 when 'rock'
                   "It's tie!"
               end
  win_status
end

def paper_win?(paper)
  win_status = case paper
                 when 'rock', 'spock'
                   "You won!"
                 when 'lizard', 'scissors'
                   "Computer won!"
                 when 'paper'
                   "It's tie!"
               end
  win_status
end

def scissors_win?(scissors)
  win_status = case scissors
                 when 'paper', 'lizard'
                   'You won!'
                 when 'rock', 'spock'
                   "Computer won!"
                 when 'scissors'
                   "It's tie!"
               end
  win_status
end

def lizard_win?(lizard)
  win_status = case lizard
                 when 'paper', 'spock'
                   'You won!'
                 when 'rock', 'scissors'
                   "Computer won!"
                 when 'lizard'
                   "It's tie!"
               end
  win_status
end

def spock_win?(spock)
  win_status = case spock
                 when 'rock', 'scissors'
                   'You won!'
                 when 'lizard', 'paper'
                   "Computer won!"
                 when 'spock'
                   "It's tie!"
            end
  win_status
end


def win?(first, second)
  win_status = case first
                 when 'rock', 'r'
                   rock_win?(second)
                 when 'paper', 'p'
                   paper_win?(second)
                 when 'scissors'
                   scissors_win?(second)
                 when 'lizard', 'l'
                   lizard_win?(second)
                 when 'spock'
                   spock_win?(second)
               end
  win_status
end

def display_results(player, computer)
  prompt(win?(player, computer))
  win?(player, computer)
end

def win_counter(players, computers)
  if win?(players, computers) == "You won!"
    @player_counter += 1
  elsif win?(players, computers) == "Computer won!"
    @computer_counter += 1
  else
    prompt("No one win!")
  end
end

def display_counter(player_counter, computer_counter)
  if (player_counter > 4) && (player_counter > computer_counter)
    prompt("You won 5 times already! You are great player! ")

  elsif (computer_counter > 4) && (computer_counter > player_counter)
    prompt("You lose 5 times already! You play sucks!")

  else
    prompt("You won #{player_counter} times, computer won #{computer_counter} times!")
  end
end

@player_counter = 0
@computer_counter = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICE.join(',')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICE.include?(choice) || VALID_CHOICE_CHR.include?(choice.downcase)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  second_choice = ''
  unless choice.downcase != 's'
    loop do
      prompt("You mean 1)'scissors' or 2)'spock'?(Input 1 or 2)")
      second_choice = Kernel.gets().chomp()

      if %w(1 2).include?(second_choice)
        break
      else
        prompt("That's not a valid choice!")
      end
    end
    choice = case second_choice
               when '1'
                 'scissors'
               when '2'
                 'spock'
             end
  end

  computer_choice = VALID_CHOICE.sample()

  Kernel.puts("Your choice:#{choice}, and computer choice is #{computer_choice}")

  display_results(choice.downcase, computer_choice)

  win_counter(choice.downcase, computer_choice)

  display_counter(@player_counter, @computer_counter)


  #prompt("Do you want play again?(Y for play again!)")
  #answer = Kernel.gets().chomp()
  #break unless answer.downcase.start_with?('y')
end

prompt("Thanks for your playing!Good Bye!")
