display.setStatusBar( display.DarkStatusBar )

local storyboard = require ("storyboard")
local scene = storyboard.newScene()

function scene:createScene(event)



end


function scene:enterScene(event)
	local screenGroup = self.view
    local params = event.params
    x=params.label
    print( x )
    if (params.from=="screen") then
    	print( "going to screen" )
    	storyboard.purgeScene("screen")
		storyboard.gotoScene( "screen" ,{effect=params.trans, time=500, params={label=x}})
		-- screenGroup:destroyScene()
		-- screenGroup:createScene()
		storyboard.reloadScene()
    elseif (params.from=="intermediate") then
    	storyboard.purgeScene("intermediate")
    	storyboard.gotoScene("intermediate",{effect=params.trans, time=500, params={label=params.label,score=params.score}})    
    elseif (params.from=="expert") then
    	storyboard.purgeScene("expert")
    	storyboard.gotoScene("expert",{effect=params.trans, time=500, params={label=params.label,score=params.score}})    	
    end
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


