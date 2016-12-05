class World

  attr_accessor :two_dimensional_world

  EMPTY_TILE = '.'
  WALL_TILE = '#'
  LOOT_TILE = '$'
  ENTRY_TILE = '@'
  EXIT_TILE = '~'
  
  def initialize(given_height, given_width)
    @two_dimensional_world = Array.new(given_height) { Array.new(given_width, EMPTY_TILE) }
    while true
      recursive_divide(0, 0, given_height, given_width)
      set_start_and_end
      break if add_loot
    end
  end
  
  def height
    @two_dimensional_world.length
  end
  
  def width
    @two_dimensional_world.first.length
  end
  
  def to_s
    @two_dimensional_world.map { |row| row.join(' ') }.join("\n")
  end

  def flatten
    @two_dimensional_world.flatten
  end
  
  # class methods

  # ::create_as_given is used to create pre-determined worlds used for testing.
  # ::new should be used for GENERATED worlds
  def self.create_as_given(two_dimensional_array)
    height = two_dimensional_array.length
    width = two_dimensional_array.first.length
    self.new(height, width).tap do |new_world|
      new_world.two_dimensional_world = two_dimensional_array
    end
  end

  private
  # the start is always along the top of the World, and the end along the bottom.
  def set_start_and_end
    width_range = (0..width-1)
    start_x, start_y = rand(width_range), height - 1
    until(@two_dimensional_world[start_y][start_x] == EMPTY_TILE)
      start_x, start_y = rand(width_range), height - 1
    end
    @two_dimensional_world[start_y][start_x] = ENTRY_TILE
    
    end_x, end_y = rand(width_range), 0
    until(@two_dimensional_world[end_y][end_x] == EMPTY_TILE)
      end_x, end_y = rand(width_range), 0
    end
    @two_dimensional_world[end_y][end_x] = EXIT_TILE
  end

  def recursive_divide(x, y, h, w)
    return if h <= 2 || w <= 2 # our base case to end the recursion

    # choose the intersection point
    intersection_x = x + rand(w)
    intersection_y = y + rand((h / 2) + (h / 4) .. h - 1)

    # draw the horizontal wall
    (x..x + w - 1).each do |wall_x|
      @two_dimensional_world[intersection_y][wall_x] = WALL_TILE
    end

    (y..y + h - 1).each do |wall_y|
      @two_dimensional_world[wall_y][intersection_x] = WALL_TILE
    end

    @two_dimensional_world[intersection_y][intersection_x] = EMPTY_TILE
    
    direction = rand(2) == 0 ? :horizontal : :vertical

    if direction == :horizontal
      @two_dimensional_world[intersection_y][intersection_x-1] = EMPTY_TILE if intersection_x >= 1
      @two_dimensional_world[intersection_y][intersection_x+1] = EMPTY_TILE if intersection_x < width - 1
    else
      @two_dimensional_world[intersection_y-1][intersection_x] = EMPTY_TILE if intersection_y >= 1
      @two_dimensional_world[intersection_y+1][intersection_x] = EMPTY_TILE if intersection_y < height - 1
    end

    # recurse in top left and right quadrants
    # top left quadrant
    recursive_divide(x, y, intersection_y - y - 1, intersection_x - x - 1)
    # top right quadrant
    recursive_divide(intersection_x + 2, y, intersection_y - 1, w - intersection_x - 2)
  end
  
  def add_loot
   2.upto(height-1) do |depth|
      next unless rand(3) == 0 # an attempt at limiting loot
      position_x = rand(0..width-1)
      if @two_dimensional_world[depth][position_x] == EMPTY_TILE
        @two_dimensional_world[depth][position_x] = LOOT_TILE
      end
    end
  end

  def debug_fail(hash)
    puts hash
  end
end
