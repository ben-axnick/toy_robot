# Toy Robot

## Status

[![Build Status](https://travis-ci.org/bentheax/toy_robot.svg?branch=master)](https://travis-ci.org/bentheax/toy_robot)
[![Code Climate](https://codeclimate.com/github/bentheax/toy_robot/badges/gpa.svg)](https://codeclimate.com/github/bentheax/toy_robot)
[![Test Coverage](https://codeclimate.com/github/bentheax/toy_robot/badges/coverage.svg)](https://codeclimate.com/github/bentheax/toy_robot/coverage)

## Dependencies

- Ruby 2.2.5+
- Bundler 1.x

Execute `bundle install` prior to running the application or specs.

## Running

The toy robot uses Bundler to manage dependencies and as such execution should
be prefixed by `bundle exec`. Two modes of interaction are supported:

- Start interactively: `bundle exec ./exe/toy_robot`
- Stream input via stdin: `echo "FOO\nBAR" | bundle exec ./exe/toy_robot`

### Docker

If you prefer, you can utilise a Docker container:

```sh
docker-compose run --rm bundle install
docker-compose run --rm bundle exec rake
docker-compose run --rm bundle exec ./exe/toy_robot
```

## Testing

Continuous:

```sh
bundle exec guard
```

Once off:

```sh
bundle exec rspec
```

## How it works

In general, whilst not being fully functionally programmed, this application has
a heavy functional influence that holds immutability and statelessness to be
worthwhile objectives.

### The "main loop"

`exe/toy_robot` provides an entry point, then `ToyRobot::CLI` takes over. The
only job of this class is to handle IO streams. It initalises a `Session` which
sets the initial state and maintains it over time. It passes on input to a
`CommandInterpreter` which determines the appropriate action to take, and then
_replaces_ its robot with the robot returned by the command, which may or may
not be altered. Each subsequent command received will be executed against the
current state.

### The robot

Starts out unplaced. An unplaced robot only knows how to be placed, and ignore
commands. A placed robot can be moved and manipulated by calling methods that
returns modified versions of itself. Had I known about it at the time, I may
have used something like
[hamsterdam](https://github.com/atomicobject/hamsterdam).

### Movement

Orientation, movement vectors etc all defer to `TablePlacement`, `Orientation`,
and `Vector`. You may note that the table does not exist as a distinct object,
this is because it serves no useful role in the simulation (at this point).

### Commands

A `CommandInterpreter` tokenizes a line and feeds the result to its registered
commands, returning the first command that claims to match the input. Most
commands, being fairly simple, do not have individual classes, but are
constructed from a `Simple` class that takes a proc to execute. The `Wrapped`
class is similar but does not expect a robot to be created. The `Place` command,
having more complex validation requirements, _does_ have its own class.

## What else do I want you to know?

- This is exposed as an [API endpoint](https://github.com/bentheax/toy_robot_api). You should [give it a try](http://petstore.swagger.io/?url=https://toy-robot-api.pickaxe.me/assets/swagger.yaml#/default).
- This is all continuously deployed in full public view. Sensitive credentials are provided in encrypted form so that all the code can be public without compromising my AWS account.

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
