class World

  attr_accessor :two_dimensional_world

  def initialize(given_height, given_width)
    @two_dimensional_world = Array.new(given_height) { Array.new(given_width, '.') }
    recursive_divide(0, 0, given_height, given_width)
    set_start_and_end
    add_loot
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
    start_x, start_y = rand(width_range), 0
    until(@two_dimensional_world[start_y][start_x] == '.')
      start_x, start_y = rand(width_range), 0
    end
    @two_dimensional_world[start_y][start_x] = '@'
    
    end_x, end_y = rand(width_range), height - 1
    until(@two_dimensional_world[end_y][end_x] == '.')
      end_x, end_y = rand(width_range), height - 1
    end
    @two_dimensional_world[end_y][end_x] = '~'
  end

  # after much trial and error with my own (unsatisfying) algorithms,
  # i settled on a recursive division algorithm with assistance from the internet.
  # credits visable in README. This isn't 100% true to the algorithm I found
  # because my world has no walls between tiles. Tiles are walls.
  def recursive_divide(x, y, h, w)
    return if h <= 3 || w < 3 # our base case to end the recursion

    direction = case
                when h > w; rand() > w / h.to_f ? :horizontal : :vertical
                when w > h; rand() > h / w.to_f ? :vertical : :horizontal
                else rand(1) == 0 ? :vertical : :horizontal
                end
    
    wall_x = direction == :horizontal ? x : x + rand(1 .. w - 2)
    wall_y = direction == :vertical   ? y : y + rand(1 .. h - 2)

    hole_x = direction == :horizontal ? wall_x + rand(w - 2) : wall_x
    hole_y = direction == :vertical   ? wall_y + rand(h - 2) : wall_y

    length = direction == :horizontal ? w : h

    # draw the wall
    for step in (0..length - 1)
      draw_x = direction == :horizontal ? wall_x + step : wall_x
      draw_y = direction == :vertical ? wall_y + step : wall_y
      @two_dimensional_world[draw_y][draw_x] = '%'
    end

    # add the hole
    @two_dimensional_world[hole_y][hole_x] = '.'

    # recurse!
    nw, nh = direction == :horizontal ? [w, wall_y-y ] : [wall_x -x, h ]
    recursive_divide(x-1, y-1, nh, nw)
    # on the other side of the wall, too.
    new_x, new_y = direction == :horizontal ? [x, wall_y + 2] : [wall_x + 2, y]
    nw, nh = direction == :horizontal ? [w, y + h - wall_y - 2] : [x + w - wall_x - 2, h]
    recursive_divide(new_x, new_y, nh, nw)
  end

  # a simpler method that swaps out some free spaces for loot to be picked up
  # denoted by a $ and dependent upon the world size.
  def add_loot
    2.upto(height-1) do |depth|
      next if rand(2) == 0 # an attempt at limiting loot
      position_x = rand(0..width-1)
      if @two_dimensional_world[depth][position_x] == '.'
        @two_dimensional_world[depth][position_x] = '$'
      end
    end
  end
end
