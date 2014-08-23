# NetArranger

NetArranger is a JavaScript module that can
arrange a directed graph, network or diagram in 2D
so that the nodes are distributed evenly, and connected
nodes are as close to each other as possible.

It moves the nodes in a way that
connected nodes attract (linearly), while all nodes
repulse each other (inverse linearly).

NetArranger is Copyright (C) 2014 Elod Csirmaz

This program is free software; you may redistribute it and/or modify
it under the terms of the MIT License.

![NetArranger screenshot](https://raw.github.com/wiki/csirmaz/NetArranger/NetArranger.png)

Check out NetArranger live in action at http://www.epcsirmaz.com/NetArranger/

## Features

* Object-oriented code; can be used multiple times on a page
* Click on a node to highlight outgoing connections
* Drag nodes to help arrange the graph
* Connections leave a node horizontally and arrive at the destination node vertically
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
```HTML
<div id="board">
```

After the definition of the DIV,
in a JavaScript block, call
```JavaScript
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
* css -- optional; CSS classes added to the node and outgoing connections
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
| heat_reduction_time | The "heat" is reduced when the nodes stop moving, and also after every N ms specified here. Increase the number for large graphs. | 1000 |

## JavaScript interactions

There are various methods one can call on the NetArranger.Main object to interact with
the board. Call:

* mynetarranger.zoom(true) to zoom in
* mynetarranger.zoom(false) to zoom out
* mynetarranger.scroll(true, false) to scroll left
* mynetarranger.scroll(true, true) to scroll right
* mynetarranger.scroll(false, false) to scroll up
* mynetarranger.scroll(false, true) to scroll down
* mynetarranger.resetheat() to continue arranging with the original speed
