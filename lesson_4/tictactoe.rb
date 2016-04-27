#require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
    [[1, 5, 9], [3, 5, 7]]
INITIAL_MAKER = ' '.freeze
PLAYER_MAKER = 'X'.freeze
COMPUTER_MAKER = 'O'.freeze

def joinor(arr, symbol = ',', word = 'or')1
  result_str = arr.join(symbol)
  num = result_str.length.to_i - 1
  insert_word = ' ' + word + ' '

  result = result_str.insert(num, insert_word )
  return result
end

def prompt(message)
  puts "=> #{message}"
end

def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MAKER} and computer is #{COMPUTER_MAKER}"
puts ""
puts "     |     |"
puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
puts "     |     |"
puts "-----+-----+-----"
puts "     |     |"
puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
puts "     |     |"
puts "-----+-----+-----"
puts "     |     |"
puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
puts "     |     |"
puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MAKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MAKER }
end

def player_places_piece(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid number!"
  end
  brd[square] = PLAYER_MAKER
end

def computer_places_piece(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MAKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # if brd[line[0]] == PLAYER_MAKER &&
    #    brd[line[1]] == PLAYER_MAKER &&
    #    brd[line[2]] == PLAYER_MAKER
    #  return "Player"
    # elsif brd[line[0]] == COMPUTER_MAKER &&
    #    brd[line[1]] == COMPUTER_MAKER &&
    #    brd[line[2]] == COMPUTER_MAKER
    #  return "Computer"
    # end
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MAKER) == 3
      return "Player"
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MAKER) == 3
      return "Computer"
    end
  end
  nil
end


loop do #main loop
  #board = initialize_board
  total_score = []

  loop do
    board = initialize_board
      loop do # game loop
        display_board(board)

        player_places_piece(board)
        break if someone_won?(board) || board_full?(board)

        computer_places_piece(board)
        break if someone_won?(board) || board_full?(board)

      end

    display_board(board)
    p someone_won?(board)

    if someone_won?(board) == "Player"
      prompt("You win!")
      total_score << detect_winner(board)
    elsif someone_won?(board) == "Computer"
      prompt("You Lose!Computer win!")
      total_score << detect_winner(board)
    else
      prompt("It's a tie!")
      total_score << "It's a tie!"

    #if someone_won?(board)
      #prompt("#{detect_winner(board)} won!")
      #total_score << detect_winner(board)

    #else
      #prompt("It's a tie!")
      #total_score << "It's a tie!"
    end

    prompt("your score is #{total_score.count("Player")},computer score is #{total_score.count("Computer")}")
    break if total_score.count("Player") > 1 || total_score.count("Computer") > 1

    p total_score
  end




    #break if total_score.count("Player") > 1

  #break if total_score.count("Player") > 2


    #break if total_score.count("Player") > 4 || total_score.count("Computer") > 4

  prompt "Do you want play again?('Y' for again)"
  choice = gets.chomp
  break unless choice.downcase.start_with?("y")
end
