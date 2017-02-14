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

* wine
* xboxdrv
* sudo
* Steam Windows client in `~/.wine/drive_c/Program\ Files/Steam`

Please consult your package manager on how to install the programs
listed above. The Steam Windows client can be downloaded
[here](http://store.steampowered.com/about/).


## Configuration

Before you can use your Xbox 360 controllers, you must create xboxdrv
configuration files in `~/.stem/`. stem, by default, will read the
profiles `~/.stem/default_1.xboxdrv`, and `~/.stem/default_2.xboxdrv`,
for players one and two, respectively. Additional profiles can also be
created. The `examples/` directory that comes with this repo contains
example default profiles, for two players. To install these profiles
to your home, run:

```
$ cp -a examples ~/.stem
```

The mappings contained in `default_1.xboxdrv` and `default_2.xboxdrv` are:

```
[xboxdrv]
silent=true
trigger-as-button=true
ui-clear=true

[ui-buttonmap]
du=XK_Up
dd=XK_Down
dl=XK_Left
dr=XK_Right

[ui-buttonmap]
b=XK_a
x=XK_b
y=XK_c
a=XK_d
lt=XK_e
rt=XK_f
lb=XK_g
rb=XK_h

[ui-buttonmap]
select=XK_Escape
start=XK_Return
```

```
[xboxdrv]
silent=true
trigger-as-button=true
ui-clear=true

[ui-buttonmap]
du=XK_Prior
dd=XK_Next
dl=XK_Home
dr=XK_End

[ui-buttonmap]
b=XK_1
x=XK_2
y=XK_3
a=XK_4
lt=XK_5
rt=XK_6
lb=XK_7
rb=XK_8

[ui-buttonmap]
select=XK_9
start=XK_0
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

To use a specific xboxdrv profile—this is handy when a specific game
has bindings where the default profile isn't suited. The argument to
`-X` will correspond to a profile in `~/.stem`. Example launchers are
in the `launchers/` directory. Copy them to `~/bin` and modify, as it
suits you.


```
$ stem -X sg2e steam://rungameid/245170
```

To kill xboxdrv processes:

```
$ stem -k
```

To list available profiles:

```
$ stem -p
```

To list xboxdrv processes:

```
$ stem -l
```

To list detected devices:

```
$ stem -L
```

To launch the client, without overloading loaded profiles:

```
$ stem -c
```


## Miscellany

stem uses xboxdrv in keyboard emulation mode. That is, it maps the
joystick buttons to keyboard inputs. The default behavior of xboxdrv,
at least for me, is quirky—some buttons do not register
properly. Mapping them to keyboard inputs will allow greater
flexibility since most PC games use the keyboard as base device.

stem runs xboxdrv as root, via sudo. For convenience, stem expects
that xboxdrv will be run without typing the password. To make this
happen, you must first configure your sudoers file and specify that
xboxdrv shall be run without a password.


### Ubuntu, Fedora, etc.

Add xboxdrv to the sudoers file:

```
$ sudo visudo
```

At the end of the file, append the following text, substituting `<USER>`
by your username:

```
<USER> ALL = (ALL:ALL) SETENV: NOPASSWD: /usr/bin/xboxdrv
```

### NixOS

Add the following to `/etc/nixos/configuration.nix`, if you
installed xboxdrv via nix-env:

```
security.sudo.configFile = ''
  juan ALL = (ALL:ALL) SETENV: NOPASSWD: /home/juan/.nix-profile/bin/xboxdrv
''
```

Or the following, if you have `xboxdrv` in `environment.systemPackages`:

```
security.sudo.configFile = ''
  juan ALL = (ALL:ALL) SETENV: NOPASSWD: /run/current-system/sw/bin/xboxdrv
''
```

Then, rebuild:

```
# nixos-rebuild switch
```


## Additional configuration

You may need to blacklist the `xpad` driver, to make xboxdrv work. 


### Ubuntu, Fedora, etc.

Edit `/etc/modprobe.d/blacklist.conf` then add the following:

```
blacklist xpad
```

### NixOS

Add the following to `/etc/nixos/configuration.nix`:

```
blacklistedKernelModules = [ "xpad" ];
```

Then, rebuild:

```
# nixos-rebuild switch
```
