require_relative '../lib/world.rb'
require 'minitest'
require "minitest/autorun"

class WorldTest < Minitest::Test

  def test_to_s
    world = World.new( [['@', '#'],
                        ['$', '~']] )
    assert_equal world.to_s, "@ #\n$ ~"
  end
end
