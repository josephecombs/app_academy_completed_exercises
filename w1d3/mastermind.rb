class Game
  def initialize
    @code = Code.random
  end
  
  def play_game
    10.times do
      print "Guess (R, G, B, Y, O, P): "
      user_input = gets.chomp
      
      if guess(user_input) == 4
        puts 'You win the game!'
        return
      end
    end
    
    puts 'You lost the game!'
  end
  
  def guess(str)
    parsed_guess = Code.parse(str)
    
    matches, near_matches = @code.match(parsed_guess)
      
    puts "matches: #{matches}, right color wrong spot: #{near_matches}"    
    matches
  end
end

class Code
  @colors = {
    'R' => 'Red',
    'G' => 'Green',
    'B' => 'Blue',
    'Y' => 'Yellow',
    'O' => 'Orange',
    'P' => 'Purple'
  }
  
  def initialize(arr)
    @elements = arr    
  end
  
  def dup
    Code.new(self.elements.dup)
  end
  
  def self.parse(str)
    return Code.new(str.split('').map{ |c| @colors[c] })
  end
  
  def self.random   
    code = []
    
    4.times do
      code << @colors.values.sample
    end
    
    code
    
    return Code.new(code)
  end
  
  def delete_at(index)
    self.elements.delete_at(index)
  end
  
  def match(other)
    matches = 0
    matches_log = []
    
    our_temp   = self.dup
    their_temp = other.dup
    
    self.elements.each_with_index do |element, i|
      if element == other.elements[i]
        matches += 1
        matches_log << i
      end
    end
    
    matches_log.each do |i|
      our_temp.elements[i] = nil
      their_temp.elements[i] = nil
    end
    
    near_matches = (our_temp.elements & their_temp.elements).compact.count
    
    [matches, near_matches]
  end
  
  def to_s
    self.elements.inspect
  end
  
  protected
  attr_reader :elements
end


if __FILE__ == $PROGRAM_NAME
  g = Game.new
  g.play_game
end


