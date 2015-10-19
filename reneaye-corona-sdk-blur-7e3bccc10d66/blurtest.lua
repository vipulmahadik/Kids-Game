-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer 		= require( "composer" )
local scene 		= composer.newScene()

local Helper 		= require( "mod.helper" )
local BlurredImage 	= require( "mod.imageblur" )
local ScreenBlur 	= require( "mod.screenblur" )
--------------------------------------------

-- forward declarations and other locals
local _W, _H = math.floor( display.actualContentWidth + 0.5 ), math.floor( display.actualContentHeight + 0.5 )
local _W2, _H2 = _W*0.5, _H*0.5

print(_W, _H)

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	-- create a backdrop
	local background = display.newImageRect( "img/bg.jpg", _W, _H )
	background.anchorX = 0
	background.anchorY = 0
	
    -- powered by pyroixel logo
    local logo = display.newImageRect( "img/poweredbylogo.png", 255, 96 )
    logo.anchorX = 0
    logo.anchorY = 1
    logo.x = 20
    logo.y = _H - 20

	-- make a normal crate
	local crate = display.newImageRect( "img/crate.png", 90, 90 )
	crate.x, crate.y = _W/2, _H/2
	crate.rotation = 15

	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( crate )

	-- create a blurred crate
	-- use the last two numbers to change the blurring
	-- the method return a display group
	local crate2 = BlurredImage:new( sceneGroup, "img/crate.png", 90, 90, 10, 2 )
	crate2.x = _W*0.5
	crate2.y = 150
	crate2.rotation = 15

	-- create a screen blur
	-- coordinates are the are to be blurred x1,y1,x2,y2
	-- returns a display group
	local sb = ScreenBlur:new( sceneGroup, 0,0,_W,_H2)
	sb.x = _W2
	sb.y = _H2/2

	-- create a quick button to turn imageblur of crate2 on/off
    local butBlurOnOff1 = Helper:QuickButton("ImageBlur On/Off")
    butBlurOnOff1.x = _W-260
    butBlurOnOff1.y = 30
    butBlurOnOff1:addEventListener( "tap", function()
    		if crate2.isBlurHidden == true then
            	crate2:ShowBlur()
            else
            	crate2:HideBlur()
            end
        end )

    -- create a quick button to turn screenblur on/off
    local butBlurOnOff2 = Helper:QuickButton("ScreenBlur On/Off")
    butBlurOnOff2.x = _W-100
    butBlurOnOff2.y = 30
    butBlurOnOff2:addEventListener( "tap", function() 
            sb.isVisible = not sb.isVisible
        end )

    timer.performWithDelay( 5, function()
    		-- do some rotation of the crates
    		crate.rotation = crate.rotation -2
    		--crate2.rotation = crate2.rotation + 5
    		
    		-- hide the buttons so the y do not get blurred
    		butBlurOnOff1.isVisible = false
    		butBlurOnOff2.isVisible = false
    		
    		-- update the screen blur, so that the rotated crates are visible in the blurred portion
    		sb:Update()

    		-- show the buttons again
    		butBlurOnOff1.isVisible = true
    		butBlurOnOff2.isVisible = true
    	end,0 )
end





function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then

	end
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then

	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end


function Pixelate( file, obj, originalWidth, originalHeight, factor )
	local scaleFactor 	= factor or 6
	local newWidth 		= originalWidth / scaleFactor
	local newHeight 	= originalHeight / scaleFactor

	-- create white bg
	local newObj 		= display.newImageRect( "img/crate.png", newWidth, newHeight )
	newObj.x = obj.x + 100
	newObj.y = obj.y

	local capture 	= display.captureBounds( newObj.contentBounds )
	capture.x 		= obj.x
	capture.y 		= obj.y
	capture:scale( scaleFactor,scaleFactor )
	capture.rotation 	= obj.rotation
	capture.alpha 		= obj.alpha

	newObj:removeSelf()
end 
---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------


return scene