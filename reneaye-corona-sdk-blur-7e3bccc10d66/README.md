# README #

A simple 2D realtime blur experiment for Corona SDK

## What is this repository for? ##

Corona SDK does have a filter effect for gaussian blurs. But gaussian blur is too slow for realtime usage, and it is only for Corona SDK Pro users.

So I created two small modules to "simulate" a blur effect. It's not a superior visual experience. But I hope some Corona geeks will contribute their ideas to improve performance and visuals.

* ImageBlur – to create a single display image object that can be blurred
* ScreenBlur – to blur a portion (or the whole) of the screen
* NOTE: this is rather an experiment, feel free to build on it
* License: free to use for any kind of software. Attributions are welcome, but are not mandatory. 


*****


## Sample Video ##

![RealtimeBlur.jpg](https://bitbucket.org/repo/GyE7Ar/images/1901208320-RealtimeBlur.jpg)

[Video – See the blur effect in action](http://youtu.be/0A-cZ1PaAac)


*****


## How do I get set up? ##

The source code comes with an example project. You should get the idea. Basically you  only need th require the modules you need like:
```
#!lua
local BlurredImage = require( "mod.imageblur" )
local ScreenBlur = require( "mod.screenblur" )
```


*****


## Documentation of the most important methods ##

*****

# ImageBlur Module #


### BlurredImage:new( *parent*, *filename*, *width*, *height*, *steps*, *stepSize* ) ###

***parent*** – the parent group of the BlurredImage object

***filename*** – the path to the image file 

***width*** – the width of the image file 

***height*** – the height of the image file 

***steps*** – how many steps to the image gets blurred to the left and right 

***stepSize*** – how far each blur step gets moved from original image 

```
#!lua
local BlurredImage = require( "mod.imageblur" )

-- create a blurred crate
-- use the last two numbers to change the blurring
-- the method return a display group
local crate = BlurredImage:new( sceneGroup, "img/crate.png", 90, 90, 10, 2 )
```


### imageblur:HideBlur() ###

Hides the blur effect but still shows the original unblurred image.

**Example**

```
#!lua

crate:HideBlur()
```

### imageblur:ShowBlur() ###

Shows the blur effect again.

**Example**

```
#!lua

crate:ShowBlur()
```
   


*****

# ScreenBlur Module #


### ScreenBlur:new( *parent*, *xMin*, *yMin*, *xMax*, *yMax*) ### 

***parent*** – the parent group of the BlurredImage object

***xMin*** – x coordinate of the top left corner of the screen area to blur

***yMin*** – y coordinate of the top left corner of the screen area to blur

***xMax*** – x coordinate of the lower right corner of the screen area to blur

***yMax*** – y coordinate of the lower right corner of the screen area to blur

```
#!lua
local ScreenBlur = require( "mod.screenblur" )

-- create a screen blur
-- coordinates are the are to be blurred x1,y1,x2,y2
-- returns a display group
local sb = ScreenBlur:new( sceneGroup, 0,0,_W,_H2)
```


### screenblur:Update() ###

Updates the screen portion created with ScreenBlur:new(). This is need if something has moved/changed in that area.

**Example**

```
#!lua

sb:Update()
```