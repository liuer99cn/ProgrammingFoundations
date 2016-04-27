require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = ([[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]).freeze # diagnals

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
      prompt("Sorry, it's not a valid choice!")
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

def some_threat?(brd)
 !!immediate_threat(brd)
end

def immediate_threat(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
        brd[line[1]] == PLAYER_MARKER &&
        brd[line[2]] == INITIAL_MARKER
      return  'threat' #brd[line[2]] = COMPUTER_MARKER
    elsif brd[line[0]] == PLAYER_MARKER &&
          brd[line[2]] == PLAYER_MARKER &&
        brd[line[1]] == INITIAL_MARKER
      return  'threat' #brd[line[1]] = COMPUTER_MARKER

    elsif brd[line[1]] == PLAYER_MARKER &&
        brd[line[2]] == PLAYER_MARKER &&
        brd[line[0]] == INITIAL_MARKER
      return 'threat' #brd[line[0]] = COMPUTER_MARKER

    end
  end
  nil
end

def computer_places_piece!(brd)
  if some_threat?(brd)
    WINNING_LINES.each do |line|
      if brd[line[0]] == PLAYER_MARKER &&
          brd[line[1]] == PLAYER_MARKER &&
          brd[line[2]] == INITIAL_MARKER
        brd[line[2]] = COMPUTER_MARKER
      elsif brd[line[0]] == PLAYER_MARKER &&
          brd[line[2]] == PLAYER_MARKER &&
          brd[line[1]] == INITIAL_MARKER
        brd[line[1]] = COMPUTER_MARKER

      elsif brd[line[1]] == PLAYER_MARKER &&
          brd[line[2]] == PLAYER_MARKER &&
          brd[line[0]] == INITIAL_MARKER
        brd[line[0]] = COMPUTER_MARKER
        end
    end
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def computer_places_piece1!(brd)
  if some_threat?(brd) && empty_squares(brd)


    brd[square] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER

  end

end



loop do # main loop
  board = initialize_board
  total_score = []
  loop do # 5 times loop
    board = initialize_board

    loop do # game loop
      display_board(board)

      player_places_piece!(board)
      break if board_full?(board) || someone_won?(board)



      some_threat?(board)

      binding.pry

      computer_places_piece!(board)
      break if board_full?(board) || someone_won?(board)
    end

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

