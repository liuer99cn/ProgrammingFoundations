#START
#Given a collection of integers called "numbers"

#SET iterator = 1
#SET saved_number = value within numbers collection at space1

#WHILE iterator < length of numbers
  #SET current_number = value within numbers collections at space "iterator"
  #IF saved_number >= current_number
 #   go to next iterator
 # ELSE
  #  saved_number = current_number
  #iterator += 1

#PRINT saved_number


def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number = numbers[0]
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end
  p saved_number
end

find_greatest([67,2,3,499])

START
GET number1 = value of user input
GET number2 = value of user input again

SET result = number1 + number2
PRINT result
#END


START
#Given a array of strings called "arrs"
SET arr1 = []
SET iterator = 1
WHILE iterator < length of arrs
SET arr_word = value within array collection at space 1
SET arr_new = value of all of every word within arr_word
PRINT arr_new
#END

START
#Given a array of number called "number"
SET element_of_number = []








