require 'debugger'

class Fixnum
  def in_words
    ten_exp_eighteen = (self % 1000000000000000000) / 1000000000000000
    ten_exp_fifteen = (self % 1000000000000000) / 1000000000000
    ten_exp_twelve = (self % 1000000000000) / 1000000000
    ten_exp_nine = (self % 1000000000) / 1000000
    ten_exp_six = (self % 1000000) / 1000
    ten_exp_three = (self % 1000)
    if ten_exp_eighteen > 0 
      in_words_string = ten_exp_eighteen.hundred_helper + " quadrllion " + ten_exp_fifteen.hundred_helper + " trillion " + ten_exp_twelve.hundred_helper + " billion " + ten_exp_nine.hundred_helper + " million " + ten_exp_six.hundred_helper + " thousand " + ten_exp_three.hundred_helper
    elsif ten_exp_fifteen > 0
      in_words_string = ten_exp_fifteen.hundred_helper + " trillion " + ten_exp_twelve.hundred_helper + " billion " + ten_exp_nine.hundred_helper + " million " + ten_exp_six.hundred_helper + " thousand " + ten_exp_three.hundred_helper
    elsif ten_exp_twelve > 0
      in_words_string = ten_exp_twelve.hundred_helper + " billion " + ten_exp_nine.hundred_helper + " million " + ten_exp_six.hundred_helper + " thousand " + ten_exp_three.hundred_helper
    elsif ten_exp_nine > 0
      in_words_string = ten_exp_nine.hundred_helper + " million " + ten_exp_six.hundred_helper + " thousand " + ten_exp_three.hundred_helper
    elsif ten_exp_six > 0
      in_words_string = ten_exp_six.hundred_helper + " thousand " + ten_exp_three.hundred_helper
    else
      in_words_string = ten_exp_three.hundred_helper
    end
    
    in_words_string.strip
  end
  
  def hundred_helper
    small_nums = %w(zero one two three four five six seven eight nine ten eleven twelve
            thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
    tens = %w(twenty thirty fourty fifty sixty seventy eighty ninety)
    in_words_string = ""
    
    hundreds_unit = self / 100
    tens_remainder = self % 100
    tens_unit = tens_remainder / 10
    ones_unit = tens_remainder % 10
    
    if hundreds_unit > 0
      in_words_string += small_nums[hundreds_unit] + " hundred "
    end
    
    if tens_remainder < small_nums.length
      in_words_string += small_nums[tens_remainder]
    else
      in_words_string += tens[tens_unit - 2] + " "
      unless ones_unit == 0
        in_words_string += small_nums[ones_unit] + " "
      end
    end
    in_words_string.strip
  end
end

p 20.in_words
p 99.in_words
p 12.in_words
p 536.in_words
p 123.in_words
p 735_221.in_words
p 1_122_543_554_199_032.in_words
p 2_000_432_912.in_words