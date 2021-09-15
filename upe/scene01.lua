local composer = require( "composer" )
 
local player = require('player')

local scene = composer.newScene()

local physics = require('physics')
physics.start()
physics.setGravity( 0, 0 )

_W = display.contentWidth
_H = display.contentHeight

local buttonsound = audio.loadStream("assets/somdeteclaparaosbotões.mp3")

-- FUNÇÃO VOLTAR
local function gotoScene00()
    composer.gotoScene("scene00", "fade", 1000)
    audio.play(buttonsound)

    return true
end

-- FUNÇÃO AVANÇAR
local function gotoScene02()
    composer.gotoScene("scene02", "fade", 400)
    audio.play(buttonsound)
    return true
end

-- FUNCAO ARRASTAR A PEDRA
function dragdrop(e)
    
    local target = e.target
    if (e.phase == 'began') then

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
    button1.width = _W /8
    button1.height = _H / 11.5

    -- BOTÃO VOLTAR
    local button2 = display.newImage(sceneGroup, 'assets/botaovoltar.png', _W / 11, _H - 60, 20, 20)
    button2:addEventListener("tap", gotoScene00)

    --retângulo encima da imagem da pedra para criar colisao
    local r = display.newRect(sceneGroup, _W / 3.2, _H - 135, 10, 10)
    r:setFillColor(255, 99, 71, 0)
    r.name = 'pedrafixa'

    -- PEDRA PARA FAZER O FOGO
    local p = display.newImage(sceneGroup,'assets/pedracena4ajustada.png', _W / 10, _H - 180, 30, 30, {radius = 20})
    p.width = _W /9
    p.height = _H / 11
    p.name = 'pedramovel'
    p:addEventListener('touch', dragdrop )
    

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
 
    button1:removeEventListener( "tap", gotoScene02 )
    button2:removeEventListener( "tap", gotoScene00 )
    p:removeEventListener( "touch", dragdrop )

    local sceneGroup = self.view
    sceneGroup:removeSelf()
    sceneGroup = nil

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

