def caesar(str, shift)
  shifted_string = ""
  letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p',
     'q','r','s','t','u','v','w','x','y','z'] 
  
  str.each_char do |char|
    if char == " "
      shifted_string << " "
    else
      shifted_string << letters[(letters.find_index(char) + shift) % 26]
    end
  end
    
  shifted_string
end

puts caesar("hello z hello", 3)

