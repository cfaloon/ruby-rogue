#!/usr/bin/env ruby

# All the magic starts here!
require_relative 'lib/world.rb'



def custom_prompt
  integer_regex = /^-?\d+$/
  dimensions = []
  2.times do |n|
    height_width = n == 0 ? 'height' : 'width'
    while(true) do
      puts "Please enter a #{height_width} for your custom dungeon. Minimum #{height_width} is 4."
      print '> '
      input = gets.chomp
      if input =~ integer_regex
        input = input.to_i
        if input < 4
          puts "Minimum #{height_width} is 4. Please try again."
          print '> '
        else
          dimensions << input
          break
        end
      else
        puts 'That does not look like an integer.'
      end
    end
  end
  puts World.new(*dimensions)
end

# TODO: Accept command line arguments for generating the maze.
puts 'Welcome to ruby-rogue, please type (s)mall, (m)edium, (l)arge or (c)ustom to generate a dungeon.'
print '> '
while(true) do
  input = gets.chomp

  # parse the input
  case input
  when 's', 'small'
    puts World.new(6,8); break
  when 'm', 'medium'
    puts World.new(12, 16); break
  when 'l', 'large'
    puts World.new(24, 32); break
  when 'c', 'custom'
    custom_prompt; break
  else
    puts "Please choose either (s)mall, (m)edium, (l)arge or (c)ustom to generate a dungeon."
  end
end


