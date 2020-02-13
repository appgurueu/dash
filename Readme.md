# Dashing (`dash`)

Minetest mod adding a different way of boosting. An alternative to the [sprint](https://github.com/GunshipPenguin/sprint) mod.

## About

Depends on the latest [`modlib`](https://github.com/appgurueu/modlib) and [`hud_timers`](https://github.com/appgurueu/hud_timers).

Code licensed under the MIT license. Written by Lars Mueller alias LMD or appguru(eu).

## Links

* [GitHub](https://github.com/appgurueu/dash) - sources, issue tracking, contributing
* [Discord](https://discordapp.com/invite/ysP74by) - discussion, chatting
* [Minetest Forum](https://forum.minetest.net/viewtopic.php?f=9&t=24211) - (more organized) discussion
* [ContentDB](https://content.minetest.net/packages/LMD/dash/) - releases (cloning from GitHub is recommended)

## Symbolic Representation

![Screenshot](screenshot.png)

## Setup

Install the mod like any other, using `git clone https://github.com/appgurueu/dash.git` or installing via ContentDB & the in-game content manager. Enable it, `modlib` & `hud_timers` and you're ready to dash!

## Features

Dash by holding/pressing the "special" key (usually <kbd>E</kbd>). A timer shows whether you're currently charging/dashing. During dashing, speed & jump height increase rapidly, while gravity/downforce decreases.

## Configuration

### `hold`

Whether to hold or press the special key.

### `charging`

Time it takes to charge a dash in seconds.

### `dashing`

Time it takes to dash in seconds.

### polynomial

A polynomial definining the dashing intensity. List of coefficients starting with x<sup>0</sup>.

### `effects`

Effects on the player.

#### `speed`

Number. Adds.

#### `jump`

Additional jump height.

#### `gravity`

Additional gravity.