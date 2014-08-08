require 'debugger'

class Game
  def initialize(guessing_player, checking_player, max_guesses)
    @max_guesses = max_guesses
    @guessing_player = guessing_player
    @checking_player = checking_player
  end
  
  def play_game
    @max_guesses.times do
      masked_word = @checking_player.get_masked_word
      puts masked_word
      if @checking_player.knows_word?
        puts 'Congratulations!'
        break
      end 
      
      guess = @guessing_player.get_guess(masked_word)
      @checking_player.update_word(guess)
    end
    
    
    
  end
end

class HumanPlayer
  def initialize
    @partial_word = ""
  end
  
  def get_guess(part_word)
    begin
      print 'Enter guess: '
      guess = gets.chomp.downcase
    end until guess_valid?(guess)
    
    guess
  end
  
  def update_word(str)

  end  
  
  def get_masked_word
    
    begin
      print 'Secret word: ' 
      new_partial_word = ""
      new_partial_word = gets.chomp
    end until new_partial_word.length == @partial_word.length || @partial_word.length == 0
    
    @partial_word = new_partial_word
    
  end
  
  def guess_valid?(guess)
    guess.length == 1 && ('a'..'z').include?(guess)
  end
  
  def knows_word?
    !@partial_word.include?('_')
  end
end

class ComputerPlayer
  def initialize
    @dictionary = File.readlines("dictionary.txt").map(&:chomp)
    @word = pick_word
    
    @partial_word = mask_word(@word)
    @wrong_guesses = []
    @last_guess = ""
  end
  
  def mask_word(word)
    temp = []
    
    word.length.times do
      temp << "_"
    end
    
    temp.join
  end
  
  def pick_word
    @dictionary.sample
  end
  
  def get_guess(part_word)
    
    if !part_word.include?(@last_guess)
      @wrong_guesses << @last_guess
    end
    
    #p "Wrong guesses before AI hist creation: #{@wrong_guesses}"
    
    update_dictionary(part_word)
    
    if @dictionary.length == 1
       return @dictionary[0]
    end
    
    histogram = Hash.new(0)
    
    cpu_guess = @dictionary.each do |word|
      word.each_char do |c|  
        next if part_word.include?(c)  
        histogram[c] = histogram[c] + 1
      end
    end   
    
    cpu_guess = histogram.sort_by do |k, v|
      v
    end.last[0]
    
    @last_guess = cpu_guess
    
    #p histogram
    
    #cpu_guess = ('a'..'z').to_a.sample
    puts cpu_guess
    cpu_guess
  end
  
  def update_word(guess)
    if @word == guess
      @partial_word = @word
    elsif @word.include? guess    
      @word.length.times do |i|
        if @word[i] == guess
          @partial_word[i] = guess
        end
      end
    end
  end
  
  def knows_word?
    !@partial_word.include?('_')
  end
  
  def get_masked_word
    print 'Secret word: '
    @partial_word
  end
  
  def update_dictionary(part_word)
    @dictionary.delete_if do |word|
      result = word.length != part_word.length || 
          !match_word(word, part_word) || 
          word.each_char.any? { |c| (@wrong_guesses.include?(c)) }
                 
      result
    end  
  end
  
  def match_word(dictionary_word, part_word)
    part_word.length.times do |i|
      if part_word[i] != '_'
        return false if dictionary_word[i] != part_word[i]
      end
    end
    true
  end
end



1000000.times do
  cpu = ComputerPlayer.new
  hum = HumanPlayer.new
  h = Game.new(cpu, cpu, 25)
#h = Game.new(hum, cpu)
  h.play_game
end