class Array
  def my_uniq
    new_arr = []
    self.each do |r|
      unless new_arr.include?(r)
        new_arr << r
      end
    end
    new_arr
  end
 
 # def two_sum
 #   new_arr = []
 #   i = 0
 #   while i < self.length
 #     j = i + 1
 #     while j < self.length
 #        if self[i] + self[j] == 0
 #          new_arr << [i,j]
 #        end
 #        j += 1
 #      end
 #      i += 1
 # end
 
  def two_sum
    new_arr = []
    self.each_with_index do |r, i|
      # ((i + 1)...self.length).each do |end_index|
      self[i..-1].each_with_index do |s, j|
        if r + s == 0 && r != 0           
          new_arr << [i, j + i]
        end
      end
    end
    new_arr
  end 
end

#s = [1,2,2,3,1]
#p s.my_uniq
# p [-1, 0, 2, -2, 1].two_sum
