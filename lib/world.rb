class World

  attr_accessor :two_dimensional_world

  def initialize(height, width)
    @two_dimensional_world = Array.new(height) { Array.new(width, '%') }
    set_start_and_end
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
  def set_start_and_end
    height_range = (0..height-1)
    width_range = (0..width-1)
    start_x, start_y = rand(width_range), rand(height_range)
    @two_dimensional_world[start_y][start_x] = '@'
    end_x, end_y = nil, nil # need these variables in scope before looping assignment
    loop do
      end_x, end_y = rand(width_range), rand(height_range)
      break if start_x != end_x && start_y != end_y # loop until these are not the same point
    end
    @two_dimensional_world[end_y][end_x] = '~'
  end
end
