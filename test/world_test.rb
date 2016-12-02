require_relative '../lib/world.rb'
require 'minitest'
require "minitest/autorun"

class WorldTest < Minitest::Test

  def test_to_s
    
    assert_equal simple_world.to_s, "@ # ~\n$ # #"
  end

  def test_height
    assert_equal simple_world.height, 2
  end

  def test_width
    assert_equal simple_world.width, 3
  end

  # helpers
  def simple_world
    World.new( [['@', '#', '~'],
                ['$', '#', '#']] )
  end
end
