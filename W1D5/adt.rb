# Exercise 1 - Stack
#
# Let's write a Stack class. To do this, use the following framework:
class Stack
  def initialize
    #initializes the stack with an empty array
    @stack=[]
  end

  def add(el)
    #adds an element to the stack
    @stack << el
    el
  end

  def remove
    #removes an element from the stack
    @stack.pop
  end

  def show
    #returns a copy of the stack
    @stack.dup
  end
end

# Exercise 2 - Queue
#
# Now let's write a Queue class. We will need the following instance methods: enqueue(el), dequeue, and show.
#
# Test your code to ensure it follows the principle of FIFO.

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    #adds an element to the queue
    @queue << el
    el
  end

  def dequeue
    #removes an element from the queue
    @queue.shift
  end

  def show
    #adds an element to the queue
    @queue.dup
  end

end

# Exercise 3 - Map
#
# As you saw in the videos for tonight, a map can be implemented using a
# 2D array. Let's write a Map class (following a similar pattern to Stack
# and Queue) that implements a map using only arrays.
#
# Remember, a map stores information in key-value pairs, where the keys
# are always unique. When implemented with arrays, a map might look
# something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
#
# Our Map class should have the following instance methods: assign(key,
# value), lookup(key), remove(key), show. Note that the assign method
# can be used to either create a new key-value pair or update the value
# for a pre-existing key. It's up to you to check whether a key
#   currently exists!
#
# As always, test your code thoroughly to make sure all properties of
# maps are enforced.

class Map
  def initialize
    @map = []
  end

  def assign(key,value)
    index_key = @map.index {|pair| pair[0]==key}
    if index_key
      @map[index_key][1] = value
    else
      @map << [key,value]
    end
    [key,value]
  end

  def lookup(key)
    @map.each do |pair|
      return pair if pair[0]==key
    end
    nil
  end

  def remove(key)
    @map.reject! do |pair|
      pair[0] == key
    end
    nil
  end

  def show(arr)
    deep_dup(arr)
  end

  def deep_dup(arr)
    arr.map do |el|
      if el.is_a? Array
        deep_dup(el)
      else
        el
      end
    end
  end

end
