

display.setStatusBar( display.DarkStatusBar )

local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local sou=audio.loadSound("blob.mp3" )

local widget = require( "widget" )
function scene:createScene(event)


	local group = self.view
	background=display.newImage("board.png", display.contentWidth*.5,display.contentHeight*.5-35)
	background.width=270
	background.height=270
	local backButton={}
	local backButton1={}
	local options, refresh
	local circle1,circle,wonText=0,0,0
	local co,c = 0,0
	local coo = 0
	local x = 17
	local y = 12
	local t={}
	local alphabet={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
	local r1,r2,r3,r4,r5,c1,c2,c3,c4,c5,x1,x2=false,false,false,false,false,false,false,false,false,false,false,false

	local box= display.newRect( display.contentWidth*0.5, 400, 200, 30 )
	local myText = display.newText( "Select an Alphabet", display.contentWidth*0.5, 400, "KeepCalm-Medium", 16 )
	myText:setFillColor( 1, 0, 0 )
	group:insert(background)
	group:insert(box)
	group:insert(myText)


	function onBackRelease( event )
		-- body
		local row = event.target
		local label=row:getLabel( )
		if (label=='B') then
			storyboard.gotoScene( "screen" ,{effect="zoomInOutFade", time=500, params={label=label}})
		end
	end


	for i=1,5 do
		for i=1,5 do
			co=co+1
			backButton[co] = widget.newButton
			{
				width = 50,
				height = 48,
				id=co,
				label=(alphabet[co]),
				onRelease = onBackRelease,
		    	defaultFile = "but.png",
				fontSize = 16,
				font="KeepCalm-Medium",
				left = 21+x,
				top = 87+y,
				labelColor = { default={ 55/255 }, over={ 245/255 } }
			}
			x=x+49
			group:insert(backButton[co])
			print( co )
		end
		y=y+49
		x=17
	end

	function action( ... )
		-- body
		storyboard.gotoScene("start", {effect="zoomInOutFade", time=500})
	end

end


function scene:enterScene(event)


end

function scene:exitScene(event)
	Runtime:removeEventListener( "key", onKeyEvent )

	
end

function scene:destroyScene(event)

end




scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene


