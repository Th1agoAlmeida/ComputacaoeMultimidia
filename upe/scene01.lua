local composer = require( "composer" )
 
local player = require('player')

local scene = composer.newScene()

local physics = require('physics')
physics.setDrawMode('debug')
physics.start()
physics.setGravity( 0, 0 )

_W = display.contentWidth
_H = display.contentHeight



-- FUNÇÃO VOLTAR
local function gotoScene00()
    composer.gotoScene("scene00", "fade", 1000)

    return true
end

-- FUNÇÃO AVANÇAR
local function gotoScene02()
    composer.gotoScene("scene02", "slideLeft", 1000)

    return true
end






-- FUNCAO ARRASTAR A PEDRA
function dragdrop(e)
    
    local target = e.target
    if (e.phase == 'began') then
    target:setFillColor(1,0,0,1)
    elseif (e.phase == 'moved') then
        target.x = e.x 
        target.y = e.y
    elseif (e.phase == 'ended') then
            
    end
end

-- CRIAR CENA
function scene:create( event ) 
    local sceneGroup = self.view
 
    local bg = display.newImage(sceneGroup, 'assets/bg0.png');
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

    local bg1 = display.newImage(sceneGroup, 'assets/Picture4.png');
    bg1.x = display.contentCenterX
    bg1.y = display.contentCenterY-140

    -- BOTÃO AVANÇAR
    local button1 = display.newImage(sceneGroup, 'assets/botaoavancar.png', _W -30, _H - 60, 20, 20)
    button1:addEventListener("tap", gotoScene02)

    -- BOTÃO VOLTAR
    local button2 = display.newImage(sceneGroup, 'assets/botaovoltar.png', _W / 11, _H - 60, 20, 20)
    button2:addEventListener("tap", gotoScene00)

    -- PEDRA PARA FAZER O FOGO
    local p = display.newRect(sceneGroup, _W / 10, _H - 180, 30, 30)
    p:addEventListener('touch', dragdrop )

    physics.addBody(p, {radius = 15});
end




-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    button:removeEventListener("tap", gotoScene02)

    
end
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene
