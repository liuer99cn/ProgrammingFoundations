require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = ([[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
    [[1, 5, 9], [3, 5, 7]]).freeze # diagnals
FIFTH_MARKER = 5
PLAYER = '1'
COMPUTER = '2'

def prompt(msg)
  puts"=>#{msg}"
  puts"-------------------------------------"
end

def display_board(brd)
  #system 'clear'
  puts "You are #{PLAYER_MARKER},Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square#{empty_squares(brd).join(',')}:")
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt("Sorry, it's a valid choice!bad!")
    end
  end
  brd[square] = PLAYER_MARKER
end


def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
        brd[line[1]] == PLAYER_MARKER &&
        brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
        brd[line[1]] == COMPUTER_MARKER &&
        brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil

  # defense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # offense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square && empty_squares(brd).include?(FIFTH_MARKER)
    square = FIFTH_MARKER
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def player_first(brd)
  loop do # game loop
    display_board(brd)

    player_places_piece!(brd)
    break if board_full?(brd) || someone_won?(brd)

    computer_places_piece!(brd)
    break if board_full?(brd) || someone_won?(brd)
  end
end

def computer_first(brd)
  loop do # game loop
    computer_places_piece!(brd)
    break if board_full?(brd) || someone_won?(brd)

    display_board(brd)

    player_places_piece!(brd)
    break if board_full?(brd) || someone_won?(brd)
  end
end

def who_play_first
  choice_input = ''
  loop do
    prompt"Please select who play first: 1)Player 2)Computer (Input '1' or '2')"
    choice_input = gets.chomp
      if choice_input == PLAYER
        break
      elsif choice_input == COMPUTER
        break
      else
        prompt"Invalid choice! Please input again!"
      end
  end
  return choice_input
end

loop do # main loop
  board = initialize_board
  total_score = []
  choice = who_play_first

  loop do # 5 times loop
    board = initialize_board

      if choice == PLAYER
      player_first(board)
      elsif choice == COMPUTER
      computer_first(board)
      end

    display_board(board)

    if someone_won?(board)
      prompt"#{detect_winner(board)} won!"
      total_score << detect_winner(board)
      prompt"Your score is #{total_score.count("Player")},Computer score is #{total_score.count("Computer")}"
    else
      prompt"It's a tie!"
      prompt"Your score is #{total_score.count("Player")},Computer score is #{total_score.count("Computer")}"
    end
    #binding.pry

    break if total_score.count("Player") > 4 || total_score.count("Computer") > 4
  end

  if total_score.count("Player") > total_score.count("Computer")
    prompt"You are great! you win 5 times!"
  elsif total_score.count("Player") < total_score.count("Computer")
    prompt"You are such a looser!"
  end

  prompt"Do you want play again?('Y' for play again!)"
  choice = gets.chomp
  break unless choice.downcase.start_with?('y')
end

prompt("Thanks for play tictactoe!")

