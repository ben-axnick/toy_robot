# Toy Robot

Note: Whilst this has a full, passing, test suite. I'm still refactoring toward
the best possible solution, and there's plenty of sharp edges. I'm committing blocks
of code as-is. In a production scenario, I'd be rebasing like David Tennant to
keep commit history free of spurious detail.

## Status

[![Code Climate](https://codeclimate.com/github/bentheax/toy_robot/badges/gpa.svg)](https://codeclimate.com/github/bentheax/toy_robot)
[![Build Status](https://travis-ci.org/bentheax/toy_robot.svg?branch=master)](https://travis-ci.org/bentheax/toy_robot)

## Dependencies

- Ruby 2.2.5+
- Bundler 1.x

Execute `bundle install` prior to running the application or specs.

## Running

The toy robot uses Bundler to manage dependencies and as such execution should
be prefixed by `bundle exec`. Two modes of interaction are supported:

- Start interactively: `bundle exec ./bin/runner.rb`
- Stream input via stdin: `echo "FOO\nBAR" | bundle exec ./bin/runner.rb` 

## Testing

```
bundle exec rspec
```

## Upcoming work

- Need to fix the weakness of the `orientation` variable. It's 90% of
    `TablePlacement` and should clearly just be its own data structure.
- Need to think about PORO coercions and validations in general an how that
    should be structured sanely. Basically I want
    [Virtus](https://github.com/solnic/virtus), but I don't want to pull the
    dependency since it's overkill for two ints and an enum

## The Spec

- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.

Create an application that can read in commands of the following form

    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT

- PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.
- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
- Any move that would cause the robot to fall must be ignored.
