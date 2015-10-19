display.setStatusBar( display.DarkStatusBar )

local storyboard = require ("storyboard")
local scene = storyboard.newScene()


local Helper 		= require( "mod.helper" )
local BlurredImage 	= require( "mod.imageblur" )
local ScreenBlur 	= require( "mod.screenblur" )


local bluerose=audio.loadSound("blue_rose.mp3" )
local banana=audio.loadSound("banana.mp3" )
local bear=audio.loadSound("bear.mp3" )
local brinjal=audio.loadSound("brinjal.mp3" )

function scene:createScene(event)

	local screenGroup = self.view
    local params = event.params

	require( "tilebg" )
	local widget = require( "widget" )
	local bg = tileBG("wood.png")
	x=0
	overlayflag=0
	local alphabets={
		{title="B",images={"banana1.jpg","bear.jpg","bluerose.jpg","brinjal.png"},audios={"banana.mp3","bear.mp3","bluerose.mp3","brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="C",images={"banana.jpg","bear.jpg","bluerose.jpg","brinjal.png"},audios={"banana.mp3","bear.mp3","bluerose.mp3","brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="D",images={"banana.jpg","bear.jpg","bluerose.jpg","brinjal.png"},audios={"banana.mp3","bear.mp3","bluerose.mp3","brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="E",images={"banana.jpg","bear.jpg","bluerose.jpg","brinjal.png"},audios={"banana.mp3","bear.mp3","bluerose.mp3","brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
	}
	function abc( ... )
			-- body
		for i=1,#alphabets do
			if (params.label==alphabets[i].title) then
				x=i
				print( x )
				return i
			end
			for j=1,#alphabets[i].images do
				print(alphabets[i].images[j].." "..alphabets[i].audios[j].." "..alphabets[i].label[j])
			end
		end
	end
	abc()
	print(x)
	print(alphabets[abc()].images[1])
	local rect = BlurredImage:new(screenGroup, "banana.jpg", 250,250, 10,5 )
	rect.xScale=.5
	rect.yScale=.5
	rect.x=display.contentCenterX-80
	rect.y=display.contentCenterY-80
	-- transition.to( rect, {x=display.contentWidth*.5-90, time=2000, transition=easing.inOutCubic } )
	function oer (event)
		-- body
		local sb= ScreenBlur:new( screenGroup, 0,0,display.contentWidth,display.contentHeight )
		sb.x=display.contentCenterX
		sb.y=display.contentCenterY
		sb:Show()
		audio.play( banana )
		group=display.newGroup( )
		cover=display.newRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
		cover:setFillColor( 0 )
		cover.alpha=.6
		over=display.newRoundedRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth*.9, display.contentHeight*.6, 20 )
		img=display.newImage( group, "banana.jpg", over.x,over.y-20 )
		img.width=over.width*.5
		img.height=over.height*.5
		image=display.newText( group, "Banana", img.x, img.y+over.height*.3, "KeepCalm-Medium", 30 )
		image:setFillColor( 80/255 )

		group:addEventListener( "tap", function( ... )
			-- body
			sb:Hide()
			group:removeSelf( )
			return true
		end )
	end
	rect:addEventListener( "tap", oer )



	local title=display.newText( screenGroup, "TAP ME !", display.contentCenterX, rect.y-100, "Sassy Molassy", 30 )
	title:setFillColor( 80/255 )


	-- screenGroup:insert( rect )
	local rect1 = BlurredImage:new(screenGroup, "bluerose.jpg", 250,250, 10,5 )
	rect1.xScale=.5
	rect1.yScale=.5
	rect1.x=display.contentCenterX-80
	rect1.y=display.contentCenterY+80
	-- transition.to( rect1, {x=display.contentWidth*.5-90, time=2000, transition=easing.inOutCubic } )
	function oer1 (event)
		-- body
		overlayflag=1
		local sb= ScreenBlur:new( screenGroup, 0,0,display.contentWidth,display.contentHeight )
		sb.x=display.contentCenterX
		sb.y=display.contentCenterY
		sb:Show()
		audio.play( bluerose )
		group=display.newGroup( )
		cover=display.newRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
		cover:setFillColor( 0 )
		cover.alpha=.6
		over=display.newRoundedRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth*.9, display.contentHeight*.6, 20 )
		img=display.newImage( group, "bluerose.jpg", over.x,over.y-20 )
		img.width=over.width*.5
		img.height=over.height*.5
		image=display.newText( group, "Blue Rose", img.x, img.y+over.height*.3, "KeepCalm-Medium", 30 )
		image:setFillColor( 80/255 )
		screenGroup:insert( group )

		function close_overlay( ... )
			-- body
			sb:Hide()
			group:removeSelf( )
			overlayflag=0
			return true
		end 
		group:addEventListener( "tap", close_overlay)
	end
	rect1:addEventListener( "tap", oer1 )
	-- screenGroup:insert( rect )
	local rect3 = BlurredImage:new(screenGroup, "bear.jpg", 250,250, 10,5 )
	rect3.xScale=.5
	rect3.yScale=.5
	rect3.x=display.contentCenterX+80
	rect3.y=display.contentCenterY-80
	-- transition.to( rect3, {x=display.contentWidth*.5+90, time=2000, transition=easing.inOutCubic } )
	function oer2 (event)
		-- body
		local sb= ScreenBlur:new( screenGroup, 0,0,display.contentWidth,display.contentHeight )
		sb.x=display.contentCenterX
		sb.y=display.contentCenterY
		sb:Show()
		audio.play( bear )
		group=display.newGroup( )
		cover=display.newRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
		cover:setFillColor( 0 )
		cover.alpha=.6
		over=display.newRoundedRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth*.9, display.contentHeight*.6, 20 )
		img=display.newImage( group, "bear.jpg", over.x,over.y-20 )
		img.width=over.width*.5
		img.height=over.height*.5
		image=display.newText( group, "Bear", img.x, img.y+over.height*.3, "KeepCalm-Medium", 30 )
		image:setFillColor( 80/255 )

		group:addEventListener( "tap", function( ... )
			-- body
			sb:Hide()
			group:removeSelf( )
			return true
		end )
	end
	rect3:addEventListener( "tap", oer2 )
	-- screenGroup:insert( rect )
	local rect4 = BlurredImage:new(screenGroup, "brinjal.png", 250,250, 10,5 )
	rect4.xScale=.5
	rect4.yScale=.5
	rect4.x=display.contentCenterX+80
	rect4.y=display.contentCenterY+80
	-- transition.to( rect4, {x=display.contentWidth*.5+90, time=2000, transition=easing.inOutCubic } )
	function oer3 (event)
		-- body
		local sb= ScreenBlur:new( screenGroup, 0,0,display.contentWidth,display.contentHeight )
		sb.x=display.contentCenterX
		sb.y=display.contentCenterY
		sb:Show()
		audio.play( brinjal )
		group=display.newGroup( )
		cover=display.newRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
		cover:setFillColor( 0 )
		cover.alpha=.6
		over=display.newRoundedRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth*.9, display.contentHeight*.6, 20 )
		img=display.newImage( group, "brinjal.png", over.x,over.y-20 )
		img.width=over.width*.5
		img.height=over.height*.5
		image=display.newText( group, "Brinjal", img.x, img.y+over.height*.3, "KeepCalm-Medium", 30 )
		image:setFillColor( 80/255 )

		group:addEventListener( "tap", function( ... )
			-- body
			sb:Hide()
			group:removeSelf( )
			return true
		end )
	end
	rect4:addEventListener( "tap", oer3 )
	-- screenGroup:insert( rect )


end


function scene:enterScene(event)

end

function scene:exitScene(event)
	
end

function scene:destroyScene(event)
end




scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene


