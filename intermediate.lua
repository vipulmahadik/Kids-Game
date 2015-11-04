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
	marks=4
	local score=params.score
	local alphabets={
		{title="A",images={"images/apple.jpg","images/ant-2.jpg","images/aster.jpg","images/almond.jpg"} ,audios={"sounds/apple.mp3","sounds/ant.mp3","sounds/aster.mp3","sounds/almond.mp3"},label={"Apprle","Applee","Apple","Apprle", "Antt","Aant","Ant","Annt", "Asstter","Asteer","Aster","Asterr", "Alomond","Almond","Almoonnd","Allamond"},labelcorrect1={"Apple"},labelcorrect2={"Ant"},labelcorrect3={"Aster"},labelcorrect4={"Almond"}},
		{title="B",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"} ,audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana","Bananana","bnana","baanana", "Beer","Byer","Bear","Bare", "Blu Roze","Blue Roxe","Bleu Rose","Blue Rose", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Banana"},labelcorrect2={"Bear"},labelcorrect3={"Blue Rose"},labelcorrect4={"Brinjal"}},
		{title="C",images={"images/coconut.jpg","images/cat.jpg","images/cauliflower.jpg","images/carrot1.jpg"} ,audios={"sounds/coconut.mp3","sounds/cat.mp3","sounds/cauliflower.mp3","sounds/carrot.mp3"},label={"Conut","Cokonut","Coconat","Coconut", "Caat","Ccat","Cat","Catt", "Caawliflower","Cauliflowr","Caulflower","Cauliflower", "Carot","Carrot","Crrot","Carroot"},labelcorrect1={"Coconut"},labelcorrect2={"Cat"},labelcorrect3={"Cauliflower"},labelcorrect4={"Carrot"}},
		{title="D",images={"images/date.jpg","images/dog.jpg","images/dahlia.jpg","images/drumsticks.jpg"} ,audios={"sounds/date.mp3","sounds/dog.mp3","sounds/dahlia.mp3","sounds/drumstick.mp3"},label={"Dyte","Daate","Datte","Date", "Dog","Doug","Doog","Doggi", "Dahlia","Daqlia","Dahlua","Dahliya", "Bringal","Brinjal","Drumstick","Brinjel"},labelcorrect1={"Date"},labelcorrect2={"Dog"},labelcorrect3={"Dahlia"},labelcorrect4={"Drumstick"}},
		{title="E",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"} ,audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana","Bananana","bnana","baanana", "Beer","Byer","Bear","Bare", "Blu Roze","Blue Roxe","Bleu Rose","Blue Rose", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Banana"},labelcorrect2={"Bear"},labelcorrect3={"Blue Rose"},labelcorrect4={"Brinjal"}},
		{title="F",images={"images/figs.jpg","images/fox.jpg","images/bluerose.jpg","images/fish.jpg"} ,audios={"sounds/figs.mp3","sounds/fox.mp3","sounds/blue_rose.mp3","sounds/fish.mp3"},label={"Figgs","Figs","Fegs","Feegs", "Foox","Fux","Fax","Fox", "Blu Roze","Blue Roxe","Bleu Rose","Blue Rose", "Fish","Feash","Fees","Fush"},labelcorrect1={"Figs"},labelcorrect2={"Fox"},labelcorrect3={"Blue Rose"},labelcorrect4={"Fish"}},
		{title="G",images={"images/gauva.jpg","images/gorilla.jpg","images/goat.jpg","images/grape.jpg"} ,audios={"sounds/gauva.mp3","sounds/gorilla.mp3","sounds/goat.mp3","sounds/grape.mp3"},label={"Gauva","Guava","Goaua","Gyoua", "Gorilla","Gorila","Goreela","Gooreela", "Gote","Gotey","Gote","Goat", "Grpeas","Gapes","Grapes","Graeps"},labelcorrect1={"Guava"},labelcorrect2={"Gorilla"},labelcorrect3={"Goat"},labelcorrect4={"Grapes"}},
		{title="H",images={"images/honeybee.jpg","images/horse.jpg","images/hibiscus.jpg","images/honeydew.jpg"} ,audios={"sounds/honeybee.mp3","sounds/horse.mp3","sounds/hibiscus.mp3","sounds/honeydew.mp3"},label={"Honeybea","Honnibe","Honeybee","Honnibea", "Horsey","Horce","Horrse","Horse", "Hibiscus","Hyabiscus","Hiebuscus","Hiebusus", "Honey Dew","Honey Bea","Homi deu","Honey Dea"},labelcorrect1={"Honeybee"},labelcorrect2={"Horse"},labelcorrect3={"Hibiscus"},labelcorrect4={"Honeydew"}},
		{title="I",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"} ,audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana","Bananana","bnana","baanana", "Beer","Byer","Bear","Bare", "Blu Roze","Blue Roxe","Bleu Rose","Blue Rose", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Banana"},labelcorrect2={"Bear"},labelcorrect3={"Blue Rose"},labelcorrect4={"Brinjal"}},
		{title="J",images={"images/jackfruit.jpg","images/jellyfish.jpg","images/jasmine.jpg","images/jujube.jpg"} ,audios={"sounds/jackfruit.mp3","sounds/jellyfish.mp3","sounds/jasmine.mp3","sounds/jujube.mp3"},label={"Jackroot","Jeckfruit","Jackfroot","Jackfruit", "Jellyfish","Jellifish","Jellefissh","Jelifesh", "Jasmeen","Jusmine","Jasmeen","Jasmine", "Jujube","Jaujbe","Jugube","Jujubey"},labelcorrect1={"Jackfruit"},labelcorrect2={"Jellyfish"},labelcorrect3={"Jasmine"},labelcorrect4={"Jujuba"}},
		{title="K",images={"images/Kiwi-fruit.jpg","images/kangaroo.jpg","images/kangaroopaw.jpg","images/kingfisher.jpg"} ,audios={"sounds/kiwi.mp3","sounds/kangaroo.mp3","sounds/kangaroopaw.mp3","sounds/kingfisher.mp3"},label={"Keewee","Kweevee","Keve","Kewi", "Kangaroo","Kangarou","Kungarow","Kangaraw", "Kangarawpao","Kangaroopaw","Kungaraopao","Kangaraopao", "Kingfeasher","Kingfishr","Keengfisher","Kingfisher"},labelcorrect1={"Kiwi"},labelcorrect2={"Kangaroo"},labelcorrect3={"Kangaropaw"},labelcorrect4={"Kingfisher"}},
		{title="L",images={"images/lemon.jpg","images/lion.jpg","images/lotus.jpg","images/litchi.jpg"} ,audios={"sounds/lemon.mp3","sounds/lion.mp3","sounds/lotus.mp3","sounds/litchi.mp3"},label={"Leemon","Lymon","Leamon","Lemon", "Lionel","Lioen","Leon","Lion", "Lothus","Lotus","Loatus","Lotuss", "Litch","Litche","Litchie","Litchee"},labelcorrect1={"Lemon"},labelcorrect2={"Lion"},labelcorrect3={"Lotus"},labelcorrect4={"Litchi"}},
		{title="M",images={"images/mango.jpg","images/monkey.jpg","images/marigold.jpg","images/mouse.jpg"} ,audios={"sounds/mango.mp3","sounds/monkey.mp3","sounds/marigold.mp3","sounds/mouse.mp3"},label={"Man go","Mango","Manygo","Maago", "Monkey","Money","Monkie","Moneey", "Mariold","Marisold","Marigold","Maribold", "Mousse","Moease","Mice","Mouse"},labelcorrect1={"Mango"},labelcorrect2={"Monkey"},labelcorrect3={"Marigold"},labelcorrect4={"Mouse"}},
		{title="N",images={"images/nutmeg.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"} ,audios={"sounds/nutmeg.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Nutmeg","Nutleg","Nugteg","Nutfeg", "Beer","Byer","Bear","Bare", "Blu Roze","Blue Roxe","Bleu Rose","Blue Rose", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Nutmeg"},labelcorrect2={"Bear"},labelcorrect3={"Blue Rose"},labelcorrect4={"Brinjal"}},
		{title="O",images={"images/orange.jpg","images/owl.jpg","images/olives.jpg","images/onion.jpg"} ,audios={"sounds/orange.mp3","sounds/owl.mp3","sounds/olives.mp3","sounds/onion.mp3"},label={"Oranye","Orance","Ourange","Orange", "Owl","Oawl","Oyul","Oal", "Ohlives","Olives","Oliges","Ovlives", "Ohnion","Oioin","Oyoun","Onion"},labelcorrect1={"Orange"},labelcorrect2={"Owl"},labelcorrect3={"Olives"},labelcorrect4={"ONions"}},
		{title="P",images={"images/pineapple.jpg","images/pegion.jpg","images/parrot.jpg","images/potato.jpg"} ,audios={"sounds/pineapple.mp3","sounds/pegion.mp3","sounds/parrot.mp3","sounds/potatoes.mp3"},label={"Pinemaple","Pnemaple","Pyneapple","Pineapple", "Pegion","Peagion","Pegin","Piegon", "Paroot","Parrot","Parot","Parut", "Patato","Poatoto","Poato","Potato"},labelcorrect1={"Pineapple"},labelcorrect2={"Pegion"},labelcorrect3={"Parrot"},labelcorrect4={"Potato"}},
		{title="Q",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"} ,audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana","Bananana","bnana","baanana", "Beer","Byer","Bear","Bare", "Roze","Roxe","Rosey","Rose", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Banana"},labelcorrect2={"Bear"},labelcorrect3={"Blue Rose"},labelcorrect4={"Brinjal"}},
		{title="R",images={"images/banana.jpg","images/rabbit.jpg","images/rose.jpg","images/brinjal.png"} ,audios={"sounds/banana.mp3","sounds/rabbit.mp3","sounds/rose.mp3","sounds/brinjal.mp3"},label={"Banana","Bananana","bnana","baanana", "Rabbit","Rabit","Robit","Rabeet", "Blu Roze","Blue Roxe","Bleu Rose","Blue Rose", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Banana"},labelcorrect2={"Rabbit"},labelcorrect3={"Rose"},labelcorrect4={"Brinjal"}},
		{title="S",images={"images/strawberry.jpg","images/bear.jpg","images/sunflower.jpeg","images/brinjal.png"} ,audios={"sounds/strawberry.mp3","sounds/bear.mp3","sounds/sunflower.mp3","sounds/brinjal.mp3"},label={"Straberi","Strawberry","Strawberi","Strayberry", "Beer","Byer","Bear","Bare", "Sufloer","Sunfloer","Sunflour","Sunflower", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Strawberry"},labelcorrect2={"Bear"},labelcorrect3={"Sunflower"},labelcorrect4={"Brinjal"}},
		{title="T",images={"images/tomato.jpg","images/tiger.jpg","images/tulip.jpg","images/tamarind.jpg"} ,audios={"sounds/tomato.mp3","sounds/tiger.mp3","sounds/tulip.mp3","sounds/tamarind.mp3"},label={"Tomato","Tomoto","Tamoato","Tamato", "Tygur","Tieger","Tiger","Tigur", "Tulee","Tuleap","Tuleep","Tulip", "Tamarind","Tamarend","Tamatind","Tamapind"},labelcorrect1={"Tomato"},labelcorrect2={"Tiger"},labelcorrect3={"Tulip"},labelcorrect4={"Tamarind"}},
		{title="U",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"} ,audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana","Bananana","bnana","baanana", "Beer","Byer","Bear","Bare", "Blu Roze","Blue Roxe","Bleu Rose","Blue Rose", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Banana"},labelcorrect2={"Bear"},labelcorrect3={"Blue Rose"},labelcorrect4={"Brinjal"}},
		{title="V",images={"images/vanilla.jpg","images/Vulture.jpg","images/bluerose.jpg","images/brinjal.png"} ,audios={"sounds/vanilla.mp3","sounds/vulture.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Vanlela","Vanilla","Vunila","Vangeela", "Vulchure","vulfur","Vulture","Vultrue", "Blu Roze","Blue Roxe","Bleu Rose","Blue Rose", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Vanilla"},labelcorrect2={"Vulture"},labelcorrect3={"Blue Rose"},labelcorrect4={"Brinjal"}},
		{title="W",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"} ,audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana","Bananana","bnana","baanana", "Beer","Byer","Bear","Bare", "Blu Roze","Blue Roxe","Bleu Rose","Blue Rose", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Banana"},labelcorrect2={"Bear"},labelcorrect3={"Blue Rose"},labelcorrect4={"Brinjal"}},
		{title="X",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"} ,audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana","Bananana","bnana","baanana", "Beer","Byer","Bear","Bare", "Blu Roze","Blue Roxe","Bleu Rose","Blue Rose", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Banana"},labelcorrect2={"Bear"},labelcorrect3={"Blue Rose"},labelcorrect4={"Brinjal"}},
		{title="Y",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"} ,audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana","Bananana","bnana","baanana", "Beer","Byer","Bear","Bare", "Blu Roze","Blue Roxe","Bleu Rose","Blue Rose", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Banana"},labelcorrect2={"Bear"},labelcorrect3={"Blue Rose"},labelcorrect4={"Brinjal"}},
		{title="Z",images={"images/banana.jpg","images/bear.jpg","images/bluerose.jpg","images/brinjal.png"} ,audios={"sounds/banana.mp3","sounds/bear.mp3","sounds/blue_rose.mp3","sounds/brinjal.mp3"},label={"Banana","Bananana","bnana","baanana", "Beer","Byer","Bear","Bare", "Blu Roze","Blue Roxe","Bleu Rose","Blue Rose", "Bringal","Brinjal","Bingal","Brinjel"},labelcorrect1={"Banana"},labelcorrect2={"Bear"},labelcorrect3={"Blue Rose"},labelcorrect4={"Brinjal"}},
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
					native.showAlert( "First Alphabet", "No alphabet before A" )
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
					native.showAlert( "LAst Alphabet", "No alphabet after Z" )
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
	local applu=audio.loadSound("sounds/applu.mp3")
	local awww=audio.loadSound("sounds/awww.mp3")
	-- function nextprev( event )
	-- 	-- body
	-- 	buttonselect=event.target
	-- 	print( buttonselect.id )
	-- 	if (buttonselect.id=="left") then
	-- 		print( alphabets[getnext()].title )
 --    		storyboard.purgeScene("passing")		
	-- 		storyboard.gotoScene("passing",{effect="slideRight", time=500, params={label=alphabets[getprev()].title,from="intermediate",trans="slideRight"}})
	-- 	end
	-- 	if (buttonselect.id=="right") then
	-- 		print( alphabets[getnext()].title )
 --    		storyboard.purgeScene("passing")		
	-- 		storyboard.gotoScene("passing",{effect="slideLeft", time=500, params={label=alphabets[getnext()].title,from="intermediate",trans="slideLeft"}})
	-- 	end
	-- end
	-- -- abc()
	-- -- print(x)
	-- -- print(alphabets[abc()].images[1].."hello")
	-- local left=widget.newButton{
	-- 	width = 40,
	-- 	height = 40,
	-- 	id="left",
 --    	defaultFile = "images/left.png",
	-- 	left = 10,
	-- 	top = display.contentHeight-80,
	-- 	onRelease=nextprev
	-- }
	-- local right=widget.newButton{
	-- 	width = 40,
	-- 	height = 40,
	-- 	id="right",
 --    	defaultFile = "images/right.png",
	-- 	left = display.contentWidth-10-40,
	-- 	top = display.contentHeight-80,
	-- 	onRelease=nextprev
	-- }
	-- screenGroup:insert( left )
	-- screenGroup:insert( right )
	local scorelabel=display.newText( screenGroup, "Your Score: "..score, display.contentCenterX, 40, "KeepCalm-Medium", 20 )
	scorelabel:setFillColor( .15 )
	local centrerect=display.newRoundedRect( screenGroup, display.contentCenterX, display.contentCenterY, 40, 23, 0 )
	centrerect:setFillColor( 1 )
	centrerect.strokeWidth=5
	centrerect:setStrokeColor( gray )
	local centrelabel=display.newText( screenGroup, params.label, centrerect.x, centrerect.y, "KeepCalm-Medium", 15 )
	centrelabel:setFillColor( 0 )
	local rect = display.newImage(screenGroup, alphabets[abc()].images[1] )
	rect.width=250 rect.height=250
	rect.xScale=.5
	rect.yScale=.5
	rect.x=display.contentCenterX-80
	rect.y=display.contentCenterY-80
	-- transition.to( rect, {x=display.contentWidth*.5-90, time=2000, transition=easing.inOutCubic } )



	local title=display.newText( screenGroup, "TAP ME !", display.contentCenterX, rect.y-100, "Sassy Molassy", 30 )
	title:setFillColor( 80/255 )


	-- screenGroup:insert( rect )
	local rect1 = display.newImage(screenGroup, "images/question.png" )
	rect1.width=250 rect1.height=250
	rect1.xScale=.5
	rect1.yScale=.5
	rect1.x=display.contentCenterX+80
	rect1.y=display.contentCenterY-80
	-- transition.to( rect1, {x=display.contentWidth*.5-90, time=2000, transition=easing.inOutCubic } )
	-- screenGroup:insert( rect )
	local rect3 = display.newImage(screenGroup, "images/question.png", 250,250, 10,5 )
	rect3.width=250 rect3.height=250
	rect3.xScale=.5
	rect3.yScale=.5
	rect3.x=display.contentCenterX-80
	rect3.y=display.contentCenterY+80
	-- transition.to( rect3, {x=display.contentWidth*.5+90, time=2000, transition=easing.inOutCubic } )
	-- screenGroup:insert( rect )
	local rect4 = display.newImage(screenGroup, "images/question.png", 250,250, 10,5 )
	rect4.width=250 rect4.height=250
	rect4.xScale=.5
	rect4.yScale=.5
	rect4.x=display.contentCenterX+80
	rect4.y=display.contentCenterY+80
	-- transition.to( rect4, {x=display.contentWidth*.5+90, time=2000, transition=easing.inOutCubic } )
	-- screenGroup:insert( rect )
	function oer (event)
		-- body
		local sb= ScreenBlur:new( screenGroup, 0,0,display.contentWidth,display.contentHeight )
		sb.x=display.contentCenterX
		sb.y=display.contentCenterY
		sb:Show()
		group=display.newGroup( )
		cover=display.newRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
		cover:setFillColor( 0 )
		function listener( ... )
			-- body
			return true
		end
		cover:addEventListener( "tap", listener)
		cover.alpha=.6		
		audio.play( banana )
		over=display.newRoundedRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth*.9, display.contentHeight*.6, 20 )
		img=display.newImage( group, alphabets[abc()].images[1], over.x,over.y-20 )
		img.width=over.width*.5
		img.height=over.height*.5
		-- image=display.newText( group, alphabets[abc()].label[1], img.x, img.y+over.height*.3, "KeepCalm-Medium", 30 )
		-- image:setFillColor( 80/255 )
		local function onSwitchPress( event )
		    local switch = event.target
		    if (switch.id==alphabets[abc()].labelcorrect1[1]) then
			    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
			    screenGroup:remove( rect1 ) rect1=null
			    score=score+marks
			    marks=4
			    scorelabel.text="Your Score: "..score
				audio.play( applu )
				thums=display.newImage( group, "images/thumsup.png", display.contentCenterX,display.contentCenterY )
				thums.alpha=.2
				thums.yScale=0.1 thums.xScale=0.1
				local listener2 = function( obj )
			    rect1=display.newImage(screenGroup, alphabets[abc()].images[2] ) rect1.width=250 rect1.height=250 rect1.xScale=.5 rect1.yScale=.5 rect1.x=display.contentCenterX+80 rect1.y=display.contentCenterY-80
			    rect1:addEventListener( "tap", oer1 )
					sb:Hide()
					group:removeSelf( )
				end
				transition.to( thums, {alpha=1,xScale=1,yScale=1, time=1000, transition=easing.outQuart,onComplete=listener2 } )
			else 
				ans.text="Wrong Answer. Try Again !"
				marks=marks-1
				audio.play( awww )
		    end
		    return true
		end

		-- Create a group for the radio button set


		-- Create two associated radio buttons (inserted into the same display group)
		ans=display.newText( group, "Click on correct Spelling", img.x-50, img.y+over.height*.3, "KeepCalm-Medium", 12 ) ans.x=over.x ans.y=over.y-130
		ans:setFillColor( 80/255 )

		op1=display.newText( group, alphabets[abc()].label[1], img.x-50, img.y+over.height*.3, "KeepCalm-Medium", 14 ) op1.x=img.x-80+op1.width*.5
		op1:setFillColor( 80/255 )
		op2=display.newText( group, alphabets[abc()].label[2], img.x+50, img.y+over.height*.3, "KeepCalm-Medium", 14 ) op2.x=img.x+50+op2.width*.5
		op2:setFillColor( 80/255 )
		op3=display.newText( group, alphabets[abc()].label[3], img.x+50, img.y+over.height*.3+50, "KeepCalm-Medium", 14 ) op3.x=img.x+50+op3.width*.5
		op3:setFillColor( 80/255 )
		op4=display.newText( group, alphabets[abc()].label[4], img.x-50, img.y+over.height*.3+50, "KeepCalm-Medium", 14 ) op4.x=img.x-80+op4.width*.5
		op4:setFillColor( 80/255 )
		local radioButton1 = widget.newSwitch{style = "radio",id = op1.text }
		radioButton1.y=op1.y
		radioButton1.x=op1.x-op1.width*.5-radioButton1.width*.5-5
		group:insert( radioButton1 )
		local radioButton2 = widget.newSwitch{style = "radio",id = op2.text }
		radioButton2.y=op2.y
		radioButton2.x=op2.x-op2.width*.5-radioButton2.width*.5-5
		group:insert( radioButton2 )
		local radioButton3 = widget.newSwitch{style = "radio",id = op3.text }
		radioButton3.y=op3.y
		radioButton3.x=op3.x-op3.width*.5-radioButton3.width*.5-5
		group:insert( radioButton3 )
		local radioButton4 = widget.newSwitch{style = "radio",id = op4.text }
		radioButton4.y=op4.y
		radioButton4.x=op4.x-op4.width*.5-radioButton4.width*.5-5
		group:insert( radioButton4 )
		radioButton1:addEventListener( "tap", onSwitchPress )
		radioButton2:addEventListener( "tap", onSwitchPress )
		radioButton3:addEventListener( "tap", onSwitchPress )
		radioButton4:addEventListener( "tap", onSwitchPress )
		screenGroup:insert( group )

	end
	rect:addEventListener( "tap", oer )
	function oer1 (event)
		-- body
		local sb= ScreenBlur:new( screenGroup, 0,0,display.contentWidth,display.contentHeight )
		sb.x=display.contentCenterX
		sb.y=display.contentCenterY
		sb:Show()
		group=display.newGroup( )
		cover=display.newRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
		cover:setFillColor( 0 )
		cover.alpha=.6
		function listener( ... )
			-- body
			return true
		end
		cover:addEventListener( "tap", listener)
		audio.play( bluerose )
		over=display.newRoundedRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth*.9, display.contentHeight*.6, 20 )
		img=display.newImage( group, alphabets[abc()].images[2], over.x,over.y-20 )
		img.width=over.width*.5
		img.height=over.height*.5
		-- image=display.newText( group, alphabets[abc()].label[1], img.x, img.y+over.height*.3, "KeepCalm-Medium", 30 )
		-- image:setFillColor( 80/255 )
		local function onSwitchPress( event )
		    local switch = event.target
		    if (switch.id==alphabets[abc()].labelcorrect2[1]) then
			    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
			    screenGroup:remove( rect3 ) rect3=null
			    score=score+marks
			    scorelabel.text="Your Score: "..score
				audio.play( applu )
			    marks=4
				thums=display.newImage( group, "images/thumsup.png", display.contentCenterX,display.contentCenterY )
				thums.alpha=.2
				thums.yScale=0.1 thums.xScale=0.1
				local listener2 = function( obj )
				    rect3=display.newImage(screenGroup, alphabets[abc()].images[3] ) rect3.width=250 rect3.height=250 rect3.xScale=.5 rect3.yScale=.5 rect3.x=display.contentCenterX-80 rect3.y=display.contentCenterY+80
					rect3:addEventListener( "tap", oer2 )
					sb:Hide()
					group:removeSelf( )
				end
				transition.to( thums, {alpha=1,xScale=1,yScale=1, time=1000, transition=easing.outQuart,onComplete=listener2 } )
			else 
				ans.text="Wrong Answer. Try Again !"
				marks=marks-1
				audio.play( awww )
			end
		    return true
		end

		-- Create a group for the radio button set


		-- Create two associated radio buttons (inserted into the same display group)

		ans=display.newText( group, "Click on correct Spelling", img.x-50, img.y+over.height*.3, "KeepCalm-Medium", 12 ) ans.x=over.x ans.y=over.y-130
		ans:setFillColor( 80/255 )
		op1=display.newText( group, alphabets[abc()].label[5], img.x-50, img.y+over.height*.3, "KeepCalm-Medium", 14 ) op1.x=img.x-80+op1.width*.5
		op1:setFillColor( 80/255 )
		op2=display.newText( group, alphabets[abc()].label[6], img.x+50, img.y+over.height*.3, "KeepCalm-Medium", 14 ) op2.x=img.x+50+op2.width*.5
		op2:setFillColor( 80/255 )
		op3=display.newText( group, alphabets[abc()].label[7], img.x+50, img.y+over.height*.3+50, "KeepCalm-Medium", 14 ) op3.x=img.x+50+op3.width*.5
		op3:setFillColor( 80/255 )
		op4=display.newText( group, alphabets[abc()].label[8], img.x-50, img.y+over.height*.3+50, "KeepCalm-Medium", 14 ) op4.x=img.x-80+op4.width*.5
		op4:setFillColor( 80/255 )
		local radioButton1 = widget.newSwitch{style = "radio",id = op1.text  }
		radioButton1.y=op1.y
		radioButton1.x=op1.x-op1.width*.5-radioButton1.width*.5-5
		group:insert( radioButton1 )
		local radioButton2 = widget.newSwitch{style = "radio",id = op2.text }
		radioButton2.y=op2.y
		radioButton2.x=op2.x-op2.width*.5-radioButton2.width*.5-5
		group:insert( radioButton2 )
		local radioButton3 = widget.newSwitch{style = "radio",id = op3.text }
		radioButton3.y=op3.y
		radioButton3.x=op3.x-op3.width*.5-radioButton3.width*.5-5
		group:insert( radioButton3 )
		local radioButton4 = widget.newSwitch{style = "radio",id = op4.text }
		radioButton4.y=op4.y
		radioButton4.x=op4.x-op4.width*.5-radioButton4.width*.5-5
		group:insert( radioButton4 )
		radioButton1:addEventListener( "tap", onSwitchPress )
		radioButton2:addEventListener( "tap", onSwitchPress )
		radioButton3:addEventListener( "tap", onSwitchPress )
		radioButton4:addEventListener( "tap", onSwitchPress )
		screenGroup:insert( group )

		group:addEventListener( "tap", function( ... )
			-- body
			sb:Hide()
			group:removeSelf( )
			return true
		end )
	end
	function oer2 (event)
		-- body
		local sb= ScreenBlur:new( screenGroup, 0,0,display.contentWidth,display.contentHeight )
		sb.x=display.contentCenterX
		sb.y=display.contentCenterY
		sb:Show()
		group=display.newGroup( )
		cover=display.newRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
		cover:setFillColor( 0 )
		cover.alpha=.6
		function listener( ... )
			-- body
			return true
		end
		cover:addEventListener( "tap", listener)
		audio.play( bear )
		over=display.newRoundedRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth*.9, display.contentHeight*.6, 20 )
		img=display.newImage( group, alphabets[abc()].images[3], over.x,over.y-20 )
		img.width=over.width*.5
		img.height=over.height*.5
		-- image=display.newText( group, alphabets[abc()].label[1], img.x, img.y+over.height*.3, "KeepCalm-Medium", 30 )
		-- image:setFillColor( 80/255 )
		local function onSwitchPress( event )
		    local switch = event.target
		    if (switch.id==alphabets[abc()].labelcorrect3[1]) then
			    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
			    screenGroup:remove( rect4 ) rect4=null
			    score=score+marks
			    scorelabel.text="Your Score: "..score
				audio.play( applu )
				thums=display.newImage( group, "images/thumsup.png", display.contentCenterX,display.contentCenterY )
				thums.alpha=.2
				thums.yScale=0.1 thums.xScale=0.1
				local listener2 = function( obj )
				    rect4=display.newImage(screenGroup, alphabets[abc()].images[4] ) rect4.width=250 rect4.height=250 rect4.xScale=.5 rect4.yScale=.5 rect4.x=display.contentCenterX+80 rect4.y=display.contentCenterY+80
					rect4:addEventListener( "tap", oer3 )
					sb:Hide()
					group:removeSelf( )
				end
				transition.to( thums, {alpha=1,xScale=1,yScale=1, time=1000, transition=easing.outQuart,onComplete=listener2 } )
			    marks=4
			else 
				ans.text="Wrong Answer. Try Again !"
				marks=marks-1
				audio.play( awww )
			end
		    return true
		end

		-- Create a group for the radio button set


		-- Create two associated radio buttons (inserted into the same display group)
		ans=display.newText( group, "Click on correct Spelling", img.x-50, img.y+over.height*.3, "KeepCalm-Medium", 12 ) ans.x=over.x ans.y=over.y-130
		ans:setFillColor( 80/255 )

		op1=display.newText( group, alphabets[abc()].label[9], img.x-50, img.y+over.height*.3, "KeepCalm-Medium", 14 ) op1.x=img.x-80+op1.width*.5
		op1:setFillColor( 80/255 )
		op2=display.newText( group, alphabets[abc()].label[10], img.x+50, img.y+over.height*.3, "KeepCalm-Medium", 14 ) op2.x=img.x+50+op2.width*.5
		op2:setFillColor( 80/255 )
		op3=display.newText( group, alphabets[abc()].label[11], img.x+50, img.y+over.height*.3+50, "KeepCalm-Medium", 14 ) op3.x=img.x+50+op3.width*.5
		op3:setFillColor( 80/255 )
		op4=display.newText( group, alphabets[abc()].label[12], img.x-50, img.y+over.height*.3+50, "KeepCalm-Medium", 14 ) op4.x=img.x-80+op4.width*.5
		op4:setFillColor( 80/255 )
		local radioButton1 = widget.newSwitch{style = "radio",id = op1.text }
		radioButton1.y=op1.y
		radioButton1.x=op1.x-op1.width*.5-radioButton1.width*.5-5
		group:insert( radioButton1 )
		local radioButton2 = widget.newSwitch{style = "radio",id = op2.text}
		radioButton2.y=op2.y
		radioButton2.x=op2.x-op2.width*.5-radioButton2.width*.5-5
		group:insert( radioButton2 )
		local radioButton3 = widget.newSwitch{style = "radio",id = op3.text }
		radioButton3.y=op3.y
		radioButton3.x=op3.x-op3.width*.5-radioButton3.width*.5-5
		group:insert( radioButton3 )
		local radioButton4 = widget.newSwitch{style = "radio",id = op4.text }
		radioButton4.y=op4.y
		radioButton4.x=op4.x-op4.width*.5-radioButton4.width*.5-5
		group:insert( radioButton4 )
		radioButton1:addEventListener( "tap", onSwitchPress )
		radioButton2:addEventListener( "tap", onSwitchPress )
		radioButton3:addEventListener( "tap", onSwitchPress )
		radioButton4:addEventListener( "tap", onSwitchPress )
		screenGroup:insert( group )

		group:addEventListener( "tap", function( ... )
			-- body
			return true
		end )
	end
	function oer3 (event)
		-- body
		local sb= ScreenBlur:new( screenGroup, 0,0,display.contentWidth,display.contentHeight )
		sb.x=display.contentCenterX
		sb.y=display.contentCenterY
		sb:Show()
		group=display.newGroup( )
		cover=display.newRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
		cover:setFillColor( 0 )
		cover.alpha=.6
		function listener( ... )
			-- body
			return true
		end
		cover:addEventListener( "tap", listener)
		audio.play( brinjal )
		over=display.newRoundedRect( group, display.contentCenterX, display.contentCenterY, display.contentWidth*.9, display.contentHeight*.6, 20 )
		img=display.newImage( group, alphabets[abc()].images[4], over.x,over.y-20 )
		img.width=over.width*.5
		img.height=over.height*.5
		-- image=display.newText( group, alphabets[abc()].label[1], img.x, img.y+over.height*.3, "KeepCalm-Medium", 30 )
		-- image:setFillColor( 80/255 )
		local function onSwitchPress( event )
		    local switch = event.target
		    if (switch.id==alphabets[abc()].labelcorrect4[1]) then
		    	print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
			    score=score+marks
			    marks=4
			    print( "Kitna mila pata he..? "..score )
			    scorelabel.text="Your Score: "..score
				audio.play( applu )
				thums=display.newImage( group, "images/thumsup.png", display.contentCenterX,display.contentCenterY )
				thums.alpha=.2
				thums.yScale=0.1 thums.xScale=0.1
				local listener2 = function( obj )
					sb:Hide()
					group:removeSelf( )
				end
				transition.to( thums, {alpha=1,xScale=1,yScale=1, time=1000, transition=easing.outQuart,onComplete=listener2 } )
				function gotonext( ... )
					-- body
	    		storyboard.purgeScene("passing")		
				storyboard.gotoScene("passing",{effect="slideLeft", time=500, params={label=alphabets[getnext()].title,from="intermediate",trans="slideLeft",score=score}})
				end
				timer.performWithDelay( 1500, gotonext )
			else 
				ans.text="Wrong Answer. Try Again !"
				marks=marks-1				
				audio.play( awww )
			end
		    return true
		end

		-- Create a group for the radio button set


		-- Create two associated radio buttons (inserted into the same display group)
		ans=display.newText( group, "Click on correct Spelling", img.x-50, img.y+over.height*.3, "KeepCalm-Medium", 12 ) ans.x=over.x ans.y=over.y-130
		ans:setFillColor( 80/255 )

		op1=display.newText( group, alphabets[abc()].label[13], img.x-50, img.y+over.height*.3, "KeepCalm-Medium", 14 ) op1.x=img.x-80+op1.width*.5
		op1:setFillColor( 80/255 )
		op2=display.newText( group, alphabets[abc()].label[14], img.x+50, img.y+over.height*.3, "KeepCalm-Medium", 14 ) op2.x=img.x+50+op2.width*.5
		op2:setFillColor( 80/255 )
		op3=display.newText( group, alphabets[abc()].label[15], img.x+50, img.y+over.height*.3+50, "KeepCalm-Medium", 14 ) op3.x=img.x+50+op3.width*.5
		op3:setFillColor( 80/255 )
		op4=display.newText( group, alphabets[abc()].label[16], img.x-50, img.y+over.height*.3+50, "KeepCalm-Medium", 14 ) op4.x=img.x-80+op4.width*.5
		op4:setFillColor( 80/255 )
		local radioButton1 = widget.newSwitch{style = "radio",id = op1.text  }
		radioButton1.y=op1.y
		radioButton1.x=op1.x-op1.width*.5-radioButton1.width*.5-5
		group:insert( radioButton1 )
		local radioButton2 = widget.newSwitch{style = "radio",id = op2.text }
		radioButton2.y=op2.y
		radioButton2.x=op2.x-op2.width*.5-radioButton2.width*.5-5
		group:insert( radioButton2 )
		local radioButton3 = widget.newSwitch{style = "radio",id = op3.text }
		radioButton3.y=op3.y
		radioButton3.x=op3.x-op3.width*.5-radioButton3.width*.5-5
		group:insert( radioButton3 )
		local radioButton4 = widget.newSwitch{style = "radio",id = op4.text }
		radioButton4.y=op4.y
		radioButton4.x=op4.x-op4.width*.5-radioButton4.width*.5-5
		group:insert( radioButton4 )
		radioButton1:addEventListener( "tap", onSwitchPress )
		radioButton2:addEventListener( "tap", onSwitchPress )
		radioButton3:addEventListener( "tap", onSwitchPress )
		radioButton4:addEventListener( "tap", onSwitchPress )
		
		screenGroup:insert( group )

		group:addEventListener( "tap", function( ... )
			-- body
			return true
		end )
	end


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


