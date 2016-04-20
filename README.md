stem
====

_stem_ is a [Steam](http://store.steampowered.com/) application launcher
that runs the Steam Windows client via
[Wine](http://www.winehq.org/). It also provides userland Xbox 360
controller support via
[xboxdrv](http://pingus.seul.org/~grumbel/xboxdrv/).


## Installation

Before you can use stem, the following programs must first be
installed:

* Wine
* xboxdrv
* Steam Windows client

Please consult your package manager on how to install the programs
listed above. The Steam Windows client can be downloaded
[here](http://store.steampowered.com/about/).


## Configuration

Before you can use your Xbox 360 controllers, you must create xboxdrv
configuration files in `~/.stem/`. stem, by default, will read the
profiles `~/.stem/default_1.xboxdrv`, and
`~/.stem/default_2.xboxdrv`, for players one and two,
respectively. Additional profiles can also be created. The `examples/`
directory that comes with this repo contains example default profiles,
for two players.

The mappings contained in `default_1.xboxdrv` and `default_2.xboxdrv` are:

```
# Player 1

Up = Up
Down = Down
Left = Left
Right = Right

B = a
X = b
Y = c
A = d
LT = e
RT = f
LB = g
RB = h

Select = Escape
Start = Return


# Player 2

Up = W
Down = S
Left = A
Right = D

B = 1
X = 2
Y = 3
A = 4
LT = 5
RT = 6
LB = 7
RB = 8

Select = 9
Start = 0
```

You may choose to set the corresponding keys for your game, from the
keyboard first, prior to running stem and using your joystick.


## Usage

To launch the Steam Windows client only:

```
$ stem
```

To launch a specific application or game:

```
$ stem steam://rungameid/12345
```

To use a specific xboxdrv profile (this is handy when a specific game
has bindings where the default profile isn't suited):


```
$ stem -X foobar steam://rungameid/12345
```

To kill xboxdrv processes:

```
$ stem -k
```

To list xboxdrv processes:

```
$ stem -l
```

To list detected devices:

```
$ stem -L
```



## Miscellany

stem uses xboxdrv in keyboard emulation mode. That is, it maps the
joystick buttons to keyboard inputs. The default behavior of xboxdrv,
at least for me, is quirky -- some buttons do not register
properly. Mapping them to keyboard inputs will allow greater
flexibility since most PC games use the keyboard as base device.


## Infrequently Asked Questions (IAQ)

1. _Why Wine?_ At the time of writing, the native Linux verion of the
Steam client, and the games played with it have a horrible performance
on my system.

2. _What's xboxdrv?_ [xboxdrv](https://github.com/xboxdrv/xboxdrv) is a
userpsace Xbox/Xbox360 gamepad driver. It lets you use your Xbox 360
device on Linux. It works similarly to xpad, only that it's better.
