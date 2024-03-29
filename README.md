# RUBY-ROGUE
___

## Introduction
**ruby-rogue** is a procedural dungeon generator written in Ruby. At the time of writing, the focus is solely on creating a dungeon, and displaying a text representation of the dungeon's contents to the user's terminal.

## How to Use

- Clone the repository
- install ruby - [RVM](https://rvm.io) is king, but even a system install on OS X *should* work.
- install bundler `gem install bundler`
- install dependencies via bundler: `bundle install`
- run it! (i.e. `ruby PATH/TO/ruby-rogue.rb`)

## FAQ

### What do each of the tiles mean?
Why, that's simple:

 Symbol | Description
 :----: | ------
 @      | The entrance to the dungeon.
 .      | A seemingly empty space. Proceed with caution.
 $      | Loot! It might be money, a weapon, an artifact, a spellbook, etc.
 %      | A stone wall that reaches from the floor to the ceiling.
 ~      | The dungeon's exit! The moonlight shines in from the outside.

### How do I run the tests?
Run this command at the project root: `ruby -Ilib:test test/world_test.rb`

## Credits
I credit the following websites for providing insights and inspiration in creating *ruby-rogue*

- http://www.roguebasin.com/
- http://journal.stuffwithstuff.com/2014/12/21/rooms-and-mazes/
- http://weblog.jamisbuck.org/2011/1/12/maze-generation-recursive-division-algorithm
