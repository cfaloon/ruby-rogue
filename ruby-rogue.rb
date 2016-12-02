#!/usr/bin/env ruby

# All the magic starts here!
require_relative 'lib/world.rb'

# the characters that will be used as tiles
TILES = %w(@ # $ % ~)


$the_world = World.create_as_given( [ ['@', '#', '%', '#', '~'],
                                      ['#', '$', '%', '#', '$'],
                                      ['%', '#', '%', '#', '#'],
                                      ['$', '#', '#', '%', '#'],
                                      ['%', '$', '#', '#', '#'] ] )

puts $the_world.to_s # print the world

puts World.new(5, 10).to_s
