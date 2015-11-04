	-----------------------------------------------------------------------------------------
	--
	-- main.lua
	--
	-----------------------------------------------------------------------------------------

-- Your code here

local storyboard = require "storyboard"


display.setStatusBar( display.TranslucentStatusBar )
require( "tilebg" )
local widget = require( "widget" )
local bg = tileBG("newbg.jpg",display.contentWidth,display.contentHeight)
overlayflag=0


local storyboard = require "storyboard"

local rect = display.newImage( "Bingo.png", display.contentWidth*.5, display.contentHeight*.5-10 )
rect.xScale=.1
rect.yScale=.1
rect.x=display.contentWidth*.5
rect.alpha=0
transition.to( rect, {x=display.contentWidth*.5,alpha=1,xScale=.3,yScale=.3, time=2000, transition=easing.outElastic } )

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
			function listener1( ... )
				-- body
					storyboard.removeScene("game_board")
			end
			timer.performWithDelay( 600, listener1 )
		end
		if(storyboard.getCurrentSceneName()=="screen") then
			storyboard.gotoScene("game_board",{effect="zoomInOutFade",time=500})
			function listener2( ... )
				-- body
					storyboard.removeScene("screen")
			end
			timer.performWithDelay( 600, listener2 )
		end
		if(storyboard.getCurrentSceneName()=="intermediate") then
			storyboard.gotoScene("game_board",{effect="zoomInOutFade",time=500})
			function listener3( ... )
				-- body
					storyboard.removeScene("intermediate")
			end
			timer.performWithDelay( 600, listener3 )
		end
		if(storyboard.getCurrentSceneName()=="expert") then
			storyboard.gotoScene("game_board",{effect="zoomInOutFade",time=500})
			function listener4( ... )
				-- body
				storyboard.removeScene("expert")
			end
			timer.performWithDelay( 600, listener4 )
		end
	end
	return true
end
Runtime:addEventListener( "key", onKeyEvent );

