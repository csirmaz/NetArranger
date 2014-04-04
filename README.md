# NetArranger

NetArranger is a JavaScript module that can
arrange a directed graph, network or diagram in 2D
so that the nodes are distributed evenly, and connected
nodes are as close to each other as possible.

It moves the nodes in a way that
connected nodes attract (linearly), while all nodes
repulse each other (inverse linearly).

NetArranger is Copyright (C) 2014 Elod Csirmaz

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.

![NetArranger screenshot](https://raw.github.com/wiki/csirmaz/NetArranger/NetArranger.png)

## Features

* Object-oriented code; can be used multiple times on a page
* Click on a node to highlight outgoing connections
* Connections leave a node horizontally and arrive at the destination node vertically
* Double-click a node to nudge it to rearrange the graph
* Tools implemented to zoom in and out and scroll the viewport

## Getting started

NetArranger uses jQuery and is written using EdnaScript.
If you have downloaded the source, get the EdnaScript
preprocessor from https://github.com/csirmaz/EdnaScript ,
and simply run *make* to compile *NetArranger.js*.
Alternatively, download the compiled files directly
from the latest release at
https://github.com/csirmaz/NetArranger/releases/latest .

To use NetArranger,
include jQuery, the NetArranger.css and NetArranger.js
libraries in the HEAD section of a webpage, and define a
DIV container in the body with an appropriate class or ID,
for example,
```
<div id="board">
```

After the definition of the DIV,
in a JavaScript block, call
```
mynetarranger = new NetArranger.Main(
   { // Data
      'nodelabel1' : { html:'<b>MyNode1</b>', css:'mycssclass', c:['nodelabel2']},
      'nodelabel2' : { html: 'Other Node' }
   },
   { // Options
      board:'#board'
   }
);
```
In the first object, list all the nodes in the graph and their connections.
Each node has a label (which is not visible), followed by an inner object
that has the following keys or properties:

* html -- specifies the HTML displayed inside the node
* css -- optional; CSS classes added to the node
* c -- optional; a list of labels representing the connections from the current node.

The second object lists options for NetArranger.
Please see the sections below for more.

Please also see *example.html* for a full example.

## Options

All options are optional.

| Key | Meaning | Default |
|---|---|---|
| board | jQuery/CSS selector for the area to display the graph in | #board |
| boardsize | An array with 2 elements for the width and height of the board | [500, 500] |
| zoom | A number indicating the zoom level | 5 |

## Advanced options

| Key | Meaning | Default |
|---|---|---|
| arranger_force | Strength of the "force" keeping the nodes close to the origin | -.01 |
| attractor_force | Strength of the "force" attracting connected nodes | .008 |
| init_heat | Inital length of displacement | 10 |
| min_heat | Length of displacement is reduced until it reaches this value, when the process stops | .001 |


## JavaScript interactions

There are various methods one can call on the NetArranger.Main object to interact with
the board. Call:

* zoom(true) to zoom in
* zoom(false) to zoom out
* scroll(true, false) to scroll left
* scroll(true, true) to scroll right
* scroll(false, false) to scroll up
* scroll(false, true) to scroll down
