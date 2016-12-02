#!/usr/bin/env ruby

# All the magic starts here!
require_relative 'world.rb'

# the characters that will be used as tiles
TILES = %w(@ # $ % ~)


$the_world = World.preconstructed_world

puts $the_world.to_s # print the world

