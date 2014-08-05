stacks = [[3, 2, 1], [], []]


puts "Welcome to Towers of Hanoi"

in_play = true
while in_play
  p "Game state: " + stacks[0].to_s, stacks[1].to_s, stacks[2].to_s
  puts "enter the tower to select discs from (0 1 or 2):"
  from_stack = gets.chomp.to_i
  puts "enter the tower to select discs from (0 1 or 2):"
  to_stack = gets.chomp.to_i
  
  if stacks[from_stack].empty?
    puts "from stack cannot be null"
  else  
    if stacks[to_stack].empty? || (stacks[from_stack][-1] < stacks[to_stack][-1]) 
      stacks[to_stack] << stacks[from_stack].pop
    else
      puts "this is an invalid move" 
    end
  end 
  
  in_play = false if stacks[2] == [3, 2, 1]
end
  
puts "You have won the game!"