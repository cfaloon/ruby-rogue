class World

  def initialize(two_dimensional_array)
    @two_dimensional_world = two_dimensional_array
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

  # class methods
  def self.preconstructed_world
    self.new( [ ['@', '#', '%', '#', '~'],
                ['#', '$', '%', '#', '$'],
                ['%', '#', '%', '#', '#'],
                ['$', '#', '#', '%', '#'],
                ['%', '$', '#', '#', '#'] ] )
  end
end
