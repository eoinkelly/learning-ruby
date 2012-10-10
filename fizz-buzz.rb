#!/usr/bin/ruby -w

# Fizzbuzz
# ########

# Write a program that prints the numbers from 1 to 100. But for multiples of
# three print "Fizz" instead of the number and for the multiples of five print
# "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".

# Attempt 1:
# (1 .. 100).each do |i|

# 	if !((i % 3 == 0) || (i % 5 == 0))
# 		print i
#   end

# 	if i % 3 == 0
# 		print "Fizz"
#   end

# 	if i % 5 == 0
# 		print "Buzz"
# 	end

# 	print "\n"

# end


# Attempt 2:

# class MegaInt
#   def initialize(n)
#     @num = n
#   end

#   def is_multiple_of(i)
#     (@num % i == 0) ? true : false
#   end
# end

# (1 .. 100).each do |i|
#   mega_i = MegaInt.new(i)

#   print i unless mega_i.is_multiple_of(3) || mega_i.is_multiple_of(5)
#   print "Fizz" if mega_i.is_multiple_of(3)
#   print "Buzz" if mega_i.is_multiple_of(5)
#   print " "
# end

# Attempt 3:
# make a "fizz buzz representation of an integer" it takes an int and spits back it's fizzbuzz rep

# todo: rename megaint
class TestableNum
  def initialize(n)
    @num = n
  end

  def is_multiple_of(i)
    (@num % i == 0) ? true : false
  end

  def to_s
      "#{@num}"
  end
end

# A FizzBuzz is a special kind of integer that has a "FizzBuzz" representation
class FizzBuzz
  def initialize(n)
    @num = TestableNum.new(n)
  end

  def to_s
    acc = ""
    acc << @num.to_s unless @num.is_multiple_of(3) || @num.is_multiple_of(5)
    acc << "Fizz" if @num.is_multiple_of(3)
    acc << "Buzz" if @num.is_multiple_of(5)

    acc
  end

end

(1 .. 100).each do |i|
  print FizzBuzz.new(i)
end

# Attempt 4: to_fizzbuzz method on numbers would be nice and clean (be able to take any num but only do our magic on ints)

(1 .. 100).each do |i|
  puts i.to_fizzbuzz
end