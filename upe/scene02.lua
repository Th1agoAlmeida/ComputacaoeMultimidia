local composer = require( "composer" )
 
local scene = composer.newScene()

_W = display.contentWidth
_H = display.contentHeight

-- FUNÇÃO AVANÇAR
local function gotoScene03()
    composer.gotoScene("scene03", "fade", 400)

    return true
end

-- FUNÇÃO VOLTAR
local function gotoScene01()
    composer.gotoScene("scene01", "fade", 400)

    return true
end

-- CRIAR CENA
function scene:create( event ) 
    local sceneGroup = self.view
 
    local bg = display.newImage(sceneGroup, 'assets/bg0.png');
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

    local bg1 = display.newImage(sceneGroup, 'assets/Picture5.png');
    bg1.x = display.contentCenterX
    bg1.y = display.contentCenterY-140

    -- BOTÃO AVANÇAR
    local button = display.newImage(sceneGroup, 'assets/botaoavancar.png', _W -30, _H - 60, 20, 20)
    button:addEventListener("tap", gotoScene03)

    -- BOTÃO VOLTAR
    local button2 = display.newImage(sceneGroup, 'assets/botaovoltar.png', _W / 11, _H - 60, 20, 20)
    button2:addEventListener("tap", gotoScene01)

        --retângulo encima da imagem da pedra para criar colisao
        local r = display.newRect(sceneGroup, _W / 3.2, _H - 135, 10, 10)
        r:setFillColor(255, 99, 71, 0)
        r.name = 'pedrafixa'
    
        -- PEDRA PARA FAZER O FOGO
        local p = display.newImage(sceneGroup,'assets/pedracena4ajustada.png', _W / 10, _H - 180, 30, 30, {radius = 20})
        p.name = 'pedramovel'
        p:addEventListener('touch', dragdrop )
        p.width = _W /9
        p.height = _H / 11
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
    -- Code here runs prior to the removal of scene's view
    button:removeEventListener("tap", gotoScene03)

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

