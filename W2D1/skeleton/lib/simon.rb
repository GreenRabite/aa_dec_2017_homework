class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length+=1
  end

  def show_sequence
    add_random_color
  end

  def require_sequence

  end

  def add_random_color
    @seq << COLORS[rand(0..COLORS.length-1)]
  end

  def round_success_message
    puts " Round successful. Get ready for the next round!"
  end

  def game_over_message
    puts "The game is over! You've made it #{@sequence_length} rounds!"
  end

  def reset_game
    @sequence_length =1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  simon = Simon.new.play
end
