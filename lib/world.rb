class World

  attr_writer :two_dimensional_world
  
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
  def self.create_as_given(two_dimensional_array)
    self.new.tap { |new_world| new_world.two_dimensional_world = two_dimensional_array }
  end
  
  def self.preconstructed_world
    self.create_as_given( [ ['@', '#', '%', '#', '~'],
                            ['#', '$', '%', '#', '$'],
                            ['%', '#', '%', '#', '#'],
                            ['$', '#', '#', '%', '#'],
                            ['%', '$', '#', '#', '#'] ] )
  end
end
