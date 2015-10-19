display.setStatusBar( display.DarkStatusBar )

local storyboard = require ("storyboard")
local scene = storyboard.newScene()


local Helper 		= require( "mod.helper" )
local BlurredImage 	= require( "mod.imageblur" )
local ScreenBlur 	= require( "mod.screenblur" )


function scene:createScene(event)

	local screenGroup = self.view
    local params = event.params

	require( "tilebg" )
	local widget = require( "widget" )
	local bg = tileBG("wood.png")
	x=0
	overlayflag=0
	local alphabets={
		{title="A",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="B",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="C",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="D",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="E",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="F",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="G",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="H",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="I",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="J",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="K",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="L",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="M",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="N",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="O",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="P",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="Q",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="R",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="S",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="T",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="U",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="V",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="W",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="X",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="Y",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="Z",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
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
local banana=audio.loadSound( alphabets[abc()].audios[1] )
local bluerose=audio.loadSound(alphabets[abc()].audios[2] )
local bear=audio.loadSound(alphabets[abc()].audios[3] )
local brinjal=audio.loadSound(alphabets[abc()].audios[4] )
	abc()
	print(x)
	print(alphabets[abc()].images[1].."hello")
	local rect = BlurredImage:new(screenGroup, alphabets[abc()].images[1], 250,250, 10,5 )
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
		img=display.newImage( group, alphabets[abc()].images[1], over.x,over.y-20 )
		img.width=over.width*.5
		img.height=over.height*.5
		image=display.newText( group, alphabets[abc()].label[1], img.x, img.y+over.height*.3, "KeepCalm-Medium", 30 )
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
	local rect1 = BlurredImage:new(screenGroup, alphabets[abc()].images[2], 250,250, 10,5 )
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
		img=display.newImage( group, alphabets[abc()].images[2], over.x,over.y-20 )
		img.width=over.width*.5
		img.height=over.height*.5
		image=display.newText( group, alphabets[abc()].label[2], img.x, img.y+over.height*.3, "KeepCalm-Medium", 30 )
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
	local rect3 = BlurredImage:new(screenGroup, alphabets[abc()].images[3], 250,250, 10,5 )
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
		img=display.newImage( group, alphabets[abc()].images[3], over.x,over.y-20 )
		img.width=over.width*.5
		img.height=over.height*.5
		image=display.newText( group, alphabets[abc()].label[3], img.x, img.y+over.height*.3, "KeepCalm-Medium", 30 )
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
	local rect4 = BlurredImage:new(screenGroup, alphabets[abc()].images[4], 250,250, 10,5 )
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
		img=display.newImage( group, alphabets[abc()].images[4], over.x,over.y-20 )
		img.width=over.width*.5
		img.height=over.height*.5
		image=display.newText( group, alphabets[abc()].label[4], img.x, img.y+over.height*.3, "KeepCalm-Medium", 30 )
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


