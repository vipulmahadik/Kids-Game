	-----------------------------------------------------------------------------------------
	--
	-- main.lua
	--
	-----------------------------------------------------------------------------------------

-- Your code here

local storyboard = require "storyboard"


display.setStatusBar( display.DarkStatusBar )
require( "tilebg" )
local widget = require( "widget" )
local bg = tileBG("cartoon.jpg",320,512)
overlayflag=0


local storyboard = require "storyboard"

local rect = display.newImage( "Bingo.png", display.contentWidth*.5, display.contentHeight*.5-10 )
rect.xScale=.4
rect.yScale=.4
rect.x=display.contentWidth*1.7
transition.to( rect, {x=display.contentWidth*.65, time=2000, transition=easing.inOutCubic } )

function listener( ... )
	-- body

	storyboard.gotoScene( "start" ,{effect="zoomInOutFade", time=500})
	rect.alpha=0
end


timer.performWithDelay( 2000, listener )

local function onKeyEvent( event )
	-- body
	phase=event.phase
	label=event.keyName
	print(phase .. overlayflag)
	if (label=="back" and phase=="up") then
		print(storyboard.getCurrentSceneName())
		if (storyboard.getCurrentSceneName()=="start") then
			native.requestExit( )
		end
		if(storyboard.getCurrentSceneName()=="game_board") then
			storyboard.gotoScene("start",{effect="zoomInOutFade",time=500})
		end
		if(storyboard.getCurrentSceneName()=="screen") then
			storyboard.gotoScene("game_board",{effect="zoomInOutFade",time=500})

		end
	end
	return true
end
Runtime:addEventListener( "key", onKeyEvent );

