# Big O-ctopus and Biggest Fish
#
# A Very Hungry Octopus wants to eat the longest fish in an array of
#fish.
#
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh',
#'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

org_fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


# Sluggish Octopus
#
# Find the longest fish in O(n^2) time. Do this by comparing all fish
#lengths to all other fish lengths
#
fish_arr = org_fish_arr.dup
def sluggish_octopus(fish_arr)
  big_fish = ""
  fish_arr.each do |fish1|
    fish_arr.each do |fish2|
      next if fish1 == fish2
      if fish1.length > fish2.length && fish1.length > big_fish.length
        big_fish = fish1
      end
    end
  end
  big_fish
end

p sluggish_octopus(fish_arr)


# Dominant Octopus
#
# Find the longest fish in O(n log n) time. Hint: You saw a sorting
#algorithm that runs in O(n log n) in the Sorting Demo. Remember that
#Big O is classified by the dominant term.
fish_arr = org_fish_arr.dup

def dominant_octopus(fish_arr)
  return fish_arr if fish_arr.length< 2
  mid_idx = fish_arr.length / 2
  left = dominant_octopus(fish_arr[0...mid_idx])
  right = dominant_octopus(fish_arr[mid_idx..-1])
  merged(left,right)
end

def merged(left,right)
  merged_arr = []
  until left.empty? || right.empty?
    if left[0].length < right[0].length
      merged_arr << left.shift
    else
      merged_arr << right.shift
    end
  end
  merged_arr + left+ right
end

p dominant_octopus(fish_arr)[-1]

#
# Clever Octopus
#
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

fish_arr = org_fish_arr.dup

def clever_octopus(fish_arr)
  big_fish = fish_arr[0]
  fish_arr.each do |fish|
    big_fish = fish if fish.length > big_fish.length
  end
  big_fish
end

p clever_octopus(fish_arr)
#
# Dancing Octopus
#
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:
#
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.
#
# Slow Dance
#
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.
#


def slow_dance_octopus(direction,tiles_array)
  tiles_array.each_with_index do |tile,idx|
    return idx if tile == direction
  end
end

p slow_dance_octopus("up", tiles_array)
# > 0
#
p slow_dance_octopus("right-down", tiles_array)
# > 3

# Constant Dance!
#
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.
#
TITLE_HASH= {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}
def fast_dance_octopus(direction)
  TITLE_HASH[direction]
end


p fast_dance_octopus("up")
# > 0
#
p fast_dance_octopus("right-down")
# > 3
