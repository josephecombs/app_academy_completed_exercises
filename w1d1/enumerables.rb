def double_array(arr)
  arr.map! { |value| value * 2}
end

class Array
  def my_each(&prc)
    for num in self
      prc.call(num)
    end
    
    self
  end
  def get_median
    sorted = self.sort
    if self.length.odd?
      sorted[self.length / 2]
    else
      (sorted[self.length / 2]+sorted[self.length / 2 - 1]) / 2.0
    end
  end
  def concatenate
    self.inject { |new_string, ele| new_string + ele }
  end
end


#p double_array([1, 2, 3, 4])
#return_value = [1, 2, 3].my_each do |num|
#  puts "my favorite number is #{num}"
#end

#p return_value
p [1, 2, 3].get_median
p [4, 7, 12, 6].get_median
p ["yay", " for", " strings"].concatenate