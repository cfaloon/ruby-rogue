#!/usr/bin/env ruby

# All the magic starts here!

# the characters that will be used as tiles
TILES = %w(@ # $ % ~)


$the_world = [ ['@', '#', '%', '#', '~'],
               ['#', '$', '%', '#', '$'],
               ['%', '#', '%', '#', '#'],
               ['$', '#', '#', '%', '#'],
               ['%', '$', '#', '#', '#'] ]

def print_world
  $the_world.each { |row| puts row.join(' ') }
end

print_world


