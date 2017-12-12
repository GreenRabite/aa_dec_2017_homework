require_relative "player"
require_relative "mancala"

class Board
  attr_accessor :cups


def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup,idx|
      next if idx == 6 || idx == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 12 || start_pos < 0
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx == 14
      next if current_player_name == @name1 && cup_idx == 13
      next if current_player_name == @name2 && cup_idx == 6
      @cups[cup_idx] << stones.pop
    end
    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx==6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length ==1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all?{|cup|cup.empty?}
    return true if @cups[7..12].all?{|cup|cup.empty?}
    false
  end

  def winner
    if @cups[6].length > @cups[13].length
      @name1
    elsif @cups[13].length > @cups[6].length
      @name2
    else
      :draw
    end
  end
end
