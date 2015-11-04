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
	local score=0
	print( "aya me" )
	local widget = require( "widget" )
	x=0
	overlayflag=0
	local alphabets={
		{title="A",images={"images/apple.jpg","images/ant-2.jpg","images/aster.jpg","images/almond.jpg"},audios={"sounds/apple.mp3","sounds/ant.mp3","sounds/aster.mp3","sounds/almond.mp3"},label={"Apple", "Ant", "Aster", "Almond"}},
		{title="B",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="C",images={"images/coconut.jpg","images/cat.jpg","images/cauliflower.jpg","images/carrot1.jpg"},audios={"sounds/coconut.mp3","sounds/cat.mp3","sounds/cauliflower.mp3","sounds/carrot.mp3"},label={"Coconut", "cat", "Cauliflower", "Carrot"}},
		{title="D",images={"images/date.jpg","images/dog.jpg","images/dahlia.jpg","images/drumsticks.jpg"},audios={"sounds/date.mp3","sounds/dog.mp3","sounds/dahlia.mp3","sounds/drumstick.mp3"},label={"Date", "Dog", "Dahlia", "Drumstick"}},
		{title="E",images={"images/figs.jpg","images/fox.jpg","images/bluerose.jpg","images/fish.jpg"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="F",images={"images/figs.jpg","images/fox.jpg","images/bluerose.jpg","images/fish.jpg"},audios={"sounds/figs.mp3","sounds/fox.mp3","sounds/blue_rose.mp3","sounds/fish.mp3"},label={"Figs", "Fox", "Blue Rose", "Fish"}},
		{title="G",images={"images/gauva.jpg","images/gorilla.jpg","images/goat.jpg","images/grape.jpg"},audios={"sounds/gauva.mp3","sounds/gorilla.mp3","sounds/goat.mp3","sounds/grapes.mp3"},label={"Gauva", "Gorilla", "Goat", "Grapes"}},
		{title="H",images={"images/honeybee.jpg","images/horse.jpg","images/hibiscus.jpg","images/honeydew.jpg"},audios={"sounds/honeybee.mp3","sounds/horse.mp3","sounds/hibiscus.mp3","sounds/honeydew.mp3"},label={"Honeybee", "Horse", "Hibiscus", "Honeydew"}},
		{title="I",images={"images/jackfruit.jpg","images/jellyfish.jpg","images/jasmine.jpg","images/jujube.jpg"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="J",images={"images/jackfruit.jpg","images/jellyfish.jpg","images/jasmine.jpg","images/jujube.jpg"},audios={"sounds/jackfruit.mp3","sounds/jellyfish.mp3","sounds/jasmine.mp3","sounds/jujube.mp3"},label={"Jackfruit", "Jellyfish", "Jasmine", "Jujube"}},
		{title="K",images={"images/Kiwi-fruit.jpg","images/kangaroo.jpg","images/kangaroopaw.jpg","images/kingfisher.jpg"},audios={"sounds/kiwi.mp3","sounds/kangaroo.mp3","sounds/kangaroopaw.mp3","sounds/kingfisher.mp3"},label={"Kiwi", "Kangaroo", "Kangaroopaw", "Kingfisher"}},
		{title="L",images={"images/lemon.jpg","images/lion.jpg","images/lotus.jpg","images/litchi.jpg"},audios={"sounds/lemon.mp3","sounds/lion.mp3","sounds/lotus.mp3","sounds/litchi.mp3"},label={"Lemon", "Lion", "Lotus", "Litchi"}},
		{title="M",images={"images/mango.jpg","images/monkey.jpg","images/marigold.jpg","images/mouse.jpg"},audios={"sounds/mango.mp3","sounds/monkey.mp3","sounds/marigold.mp3","sounds/mouse.mp3"},label={"Mango", "Monkey", "Marigold", "Mouse"}},
		{title="N",images={"images/nutmeg.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/nutmeg.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Nutmeg", "Bear", "Blue Rose", "Brinjal"}},
		{title="O",images={"images/orange.jpg","images/owl.jpg","images/olives.jpg","images/onion.jpg"},audios={"sounds/orange.mp3","sounds/owl.mp3","sounds/olives.mp3","sounds/onion.mp3"},label={"Orange", "Owl", "Olives", "Onion"}},
		{title="P",images={"images/pineapple.jpg","images/pigeon.jpg","images/parrot.jpg","images/potato.jpg"},audios={"sounds/pineapple.mp3","sounds/pegion.mp3","sounds/parrot.mp3","sounds/potatoes.mp3"},label={"Pineapple", "Pegion", "Parrot", "Potato"}},
		{title="Q",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="R",images={"images/banana.jpg","images/rabbit.jpg","images/rose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/rabbit.mp3","sounds/rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Rabbit", "Rose", "Brinjal"}},
		{title="S",images={"images/strawberry.jpg","images/bear.jpg","images/sunflower.jpeg","images/brinjal.png"},audios={"sounds/strawberry.mp3","sounds/bear.mp3","sounds/sunflower.mp3","sounds/brinjal.mp3"},label={"Strawberry", "Bear", "Sunflower", "Brinjal"}},
		{title="T",images={"images/tomato.jpg","images/tiger.jpg","images/tulip.jpg","images/tamarind.jpg"},audios={"sounds/tomato.mp3","sounds/tiger.mp3","sounds/tulip.mp3","sounds/tamarind.mp3"},label={"Tomato", "Tiger", "Tulip", "Tamarind"}},
		{title="U",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana", "Bear", "Blue Rose", "Brinjal"}},
		{title="V",images={"images/vanilla.jpg","images/Vulture.jpg","images/bluerose.jpg","images/brinjal.png"},audios={"sounds/vanilla.mp3","sounds/vulture.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Vanilla", "Vulture", "Blue Rose", "Brinjal"}},
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
		end
	end
	function getprev( ... )
			-- body
		for i=1,#alphabets do
			if (params.label==alphabets[i].title) then
				if (i==1) then
					-- native.showAlert( "First Alphabet", "No alphabet before A" )
					return 1
				else
					x=i-1
					print( x )
					return x
				end
			end
		end
	end
	function getnext( ... )
			-- body
		for i=1,#alphabets do
			if (params.label==alphabets[i].title) then
				if (i==26) then
					-- native.showAlert( "LAst Alphabet", "No alphabet after Z" )
					return 26
				else
					x=i+1
					print( x )
					return x
				end
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
	function nextprev( event )
		-- body
		buttonselect=event.target
		print( buttonselect.id )
		if (buttonselect.id=="left") then
			print( alphabets[getnext()].title )
    		storyboard.purgeScene("passing")		
			storyboard.gotoScene("passing",{effect="slideRight", time=500, params={label=alphabets[getprev()].title,from="screen",trans="slideRight"}})
		end
		if (buttonselect.id=="right") then
			print( alphabets[getprev()].title )
    		storyboard.purgeScene("passing")		
			storyboard.gotoScene("passing",{effect="slideLeft", time=500, params={label=alphabets[getnext()].title,from="screen",trans="slideLeft"}})
		end
	end
	local left=widget.newButton{
		width = 40,
		height = 40,
		id="left",
    	defaultFile = "images/left.png",
		left = 10,
		top = display.contentHeight-80,
		onRelease=nextprev
	}
	local right=widget.newButton{
		width = 40,
		height = 40,
		id="right",
    	defaultFile = "images/right.png",
		left = display.contentWidth-10-40,
		top = display.contentHeight-80,
		onRelease=nextprev
	}
	screenGroup:insert( left )
	screenGroup:insert( right )
	if (params.label=="Z") then
		screenGroup:remove( right )
		right=null
	end
	if (params.label=="A") then
		screenGroup:remove( left )
		left=null
	end

	local centrerect=display.newRoundedRect( screenGroup, display.contentCenterX, display.contentCenterY, 40, 23, 0 )
	centrerect:setFillColor( 1 )
	centrerect.strokeWidth=5
	centrerect:setStrokeColor( gray )
	local centrelabel=display.newText( screenGroup, params.label, centrerect.x, centrerect.y, "KeepCalm-Medium", 15 )
	centrelabel:setFillColor( 0 )
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
		screenGroup:insert( group )

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
		screenGroup:insert( group )

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
		screenGroup:insert( group )

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


