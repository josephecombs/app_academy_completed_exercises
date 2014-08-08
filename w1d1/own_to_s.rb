def num_to_s(num, base)
  translation_hash = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
                      5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9',
                      10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 
                      15 => 'F' }
  modified_num = []
  pow = 0
  while num / (base ** pow) != 0
    temp_number = (num / base ** pow) % base
    modified_num.unshift translation_hash[temp_number]
    pow += 1
  end
  modified_num.join
end

puts num_to_s(5,10)
puts num_to_s(5,2)
puts num_to_s(5, 16)
puts num_to_s(234, 10)
puts num_to_s(234, 2)
puts num_to_s(234, 16)