class World

  def initialize(two_dimensional_array)
    @two_dimensional_world = two_dimensional_array
  end

  def to_s
    @two_dimensional_world.map { |row| row.join(' ') }.join("\n")
  end
end
