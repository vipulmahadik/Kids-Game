display.setStatusBar( display.DarkStatusBar )

local storyboard = require ("storyboard")
local scene = storyboard.newScene()


local Helper 		= require( "mod.helper" )
local BlurredImage 	= require( "mod.imageblur" )
local ScreenBlur 	= require( "mod.screenblur" )


local sou=audio.loadSound("blob.mp3" )

function scene:createScene(event)

	local group = self.view
	easy = display.newImage( "button.png", display.contentWidth*.5,display.contentHeight*.5-80)
	easyText = display.newText( "Easy", easy.x,easy.y ,"KeepCalm-Medium", 20 )
	medium = display.newImage( "button.png", display.contentWidth*.5,display.contentHeight*.5)
	mediumText = display.newText( "Medium", medium.x,medium.y ,"KeepCalm-Medium", 20 )
	hard = display.newImage( "button.png", display.contentWidth*.5,display.contentHeight*.5+80)
	hardtextext = display.newText( "Hard", hard.x,hard.y ,"KeepCalm-Medium", 20 )
	function easyf(  )
		storyboard.gotoScene( "game_board" ,{effect="zoomInOutFade", time=500})
	end
	function mediumf(  )
		storyboard.gotoScene( "game_board" ,{effect="zoomInOutFade", time=500})
	end
	function hardf(  )
		storyboard.gotoScene( "game_board" ,{effect="zoomInOutFade", time=500})
	end
	easy:addEventListener( "tap", easyf )
	medium:addEventListener( "tap", mediumf )
	hard:addEventListener( "tap", hardf )
	group:insert(easy)
	group:insert(easyText)
	group:insert(hard)
	group:insert(hardtextext)
	group:insert(medium)
	group:insert(mediumText)
end


function scene:enterScene(event)



end

function scene:exitScene(event)


	
end

function scene:destroyScene(event)

end



-- local function onKeyEvent( event )

-- local phase = event.phase
-- local keyName = event.keyName
-- print( event.phase, event.keyName )

-- if ( "b" == keyName and phase == "up" ) then
-- 	local function onComplete( event )
-- 	    if event.action == "clicked" then
-- 	        local i = event.index
-- 	        if i == 1 then
-- 	            -- Do nothing; dialog will simply dismiss
-- 	        elseif i == 2 then
-- 	            -- Open URL if "Learn More" (second button) was clicked
-- 	            native.requestExit()
-- 	        end
-- 	    end
-- 	end
-- 	local alert = native.showAlert( "Corona", "Dream. Build. Ship.", { "Cancel", "Exit" }, onComplete )
-- end

-- return false  --SEE NOTE BELOW
-- end

-- --add the key callback
-- Runtime:addEventListener( "key", onKeyEvent )


scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene


