local composer = require( "composer" )
 
local scene = composer.newScene()

_W = display.contentWidth
_H = display.contentHeight

-- FUNÇÃO AVANÇAR
local function gotoScene05()
    composer.gotoScene("scene05", "slideLeft", 1000)

    return true
end

-- FUNÇÃO VOLTAR
local function gotoScene03()
    composer.gotoScene("scene03", "slideRight", 1000)

    return true
end

-- CRIAR CENA
function scene:create( event ) 
    local sceneGroup = self.view
 
    local bg = display.newImage(sceneGroup, 'assets/bg0.png');
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

    local bg1 = display.newImage(sceneGroup, 'assets/cena4.png');
    bg1.x = display.contentCenterX
    bg1.y = display.contentCenterY-140

    -- BOTÃO AVANÇAR
    local button = display.newImage(sceneGroup, 'assets/botaoavancar.png', _W -30, _H - 60, 20, 20)
    button:addEventListener("tap", gotoScene05)

    -- BOTÃO VOLTAR
    local button2 = display.newImage(sceneGroup, 'assets/botaovoltar.png', _W / 11, _H - 60, 20, 20)
    button2:addEventListener("tap", gotoScene03)

    -- PEDRAS PARA CONSTRUIR A CASA

    local p1 = display.newImage(sceneGroup, 'assets/pedracena4.png', _W -40, _H - 200, 20, 20)
    p1:addEventListener('touch', dragdrop )

    local p2 = display.newImage(sceneGroup, 'assets/pedracena4.png', _W -45, _H - 180, 20, 20)
    p2:addEventListener('touch', dragdrop )

    local p3 = display.newImage(sceneGroup, 'assets/pedracena4.png', _W -50, _H - 160, 20, 20)
    p3:addEventListener('touch', dragdrop )

    local p4 = display.newImage(sceneGroup, 'assets/pedracena4.png', _W -35, _H - 140, 20, 20)
    p4:addEventListener('touch', dragdrop )

    local p5 = display.newImage(sceneGroup, 'assets/pedracena4.png', _W -30, _H - 200, 20, 20)
    p5:addEventListener('touch', dragdrop )

    local p6 = display.newImage(sceneGroup, 'assets/pedracena4.png', _W -40, _H - 200, 20, 20)
    p6:addEventListener('touch', dragdrop )

    local p7 = display.newImage(sceneGroup, 'assets/pedracena4.png', _W -40, _H - 200, 20, 20)
    p7:addEventListener('touch', dragdrop )

    local p8 = display.newImage(sceneGroup, 'assets/pedracena4.png', _W -40, _H - 200, 20, 20)
    p8:addEventListener('touch', dragdrop )

    local p9 = display.newImage(sceneGroup, 'assets/pedracena4.png', _W -40, _H - 200, 20, 20)
    p9:addEventListener('touch', dragdrop )

    local p10 = display.newImage(sceneGroup, 'assets/pedracena4.png', _W -40, _H - 200, 20, 20)
    p10:addEventListener('touch', dragdrop )
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

