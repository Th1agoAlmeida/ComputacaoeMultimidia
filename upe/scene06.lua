local composer = require( "composer" )
 
local scene = composer.newScene()

_W = display.contentWidth
_H = display.contentHeight

-- FUNÇÃO AVANÇAR
local function gotoScene07()
    composer.gotoScene("scene07", "fade", 400)

    return true
end

-- FUNÇÃO VOLTAR
local function gotoScene05()
    composer.gotoScene("scene05", "fade", 400)

    return true
end

grupodepedras = display.newGroup()

-------------- PEDRA 1 ------
local pedra = display.newImage(grupodepedras, "assets/pedra1cena6.png", _W -10, _H -170)
pedra.width = _W /3
pedra.height = _H /3

-- touch listener function
function pedra:touch( event )
  if event.phase == "began" then
    -- first we set the focus on the object
    display.getCurrentStage():setFocus( self, event.id )
    self.isFocus = true

    -- then we store the original x and y position
    self.markX = self.x
    self.markY = self.y

  elseif self.isFocus then

    if event.phase == "moved" then
      -- then drag our object
      self.x = event.x - event.xStart + self.markX
      self.y = event.y - event.yStart + self.markY
    elseif event.phase == "ended" or event.phase == "cancelled" then
      -- we end the movement by removing the focus from the object
      display.getCurrentStage():setFocus( self, nil )
      self.isFocus = false
    end

  end

 return true
end

pedra:addEventListener( "touch", pedra )

------ PEDRA 2 ------
local pedra = display.newImage(grupodepedras, "assets/pedra2cena6.png", _W -300, _H -150)
pedra.width = _W /3
pedra.height = _H /3

-- touch listener function
function pedra:touch( event )
  if event.phase == "began" then
    -- first we set the focus on the object
    display.getCurrentStage():setFocus( self, event.id )
    self.isFocus = true

    -- then we store the original x and y position
    self.markX = self.x
    self.markY = self.y

  elseif self.isFocus then

    if event.phase == "moved" then
      -- then drag our object
      self.x = event.x - event.xStart + self.markX
      self.y = event.y - event.yStart + self.markY
    elseif event.phase == "ended" or event.phase == "cancelled" then
      -- we end the movement by removing the focus from the object
      display.getCurrentStage():setFocus( self, nil )
      self.isFocus = false
    end

  end

 return true
end

pedra:addEventListener( "touch", pedra )

------ PEDRA 3 ------
local pedra = display.newImage(grupodepedras, "assets/pedra3cena6.png", _W -150, _H -40)
pedra.width = _W /2.5
pedra.height = _H /5.5

-- touch listener function
function pedra:touch( event )
  if event.phase == "began" then
    -- first we set the focus on the object
    display.getCurrentStage():setFocus( self, event.id )
    self.isFocus = true

    -- then we store the original x and y position
    self.markX = self.x
    self.markY = self.y

  elseif self.isFocus then

    if event.phase == "moved" then
      -- then drag our object
      self.x = event.x - event.xStart + self.markX
      self.y = event.y - event.yStart + self.markY
    elseif event.phase == "ended" or event.phase == "cancelled" then
      -- we end the movement by removing the focus from the object
      display.getCurrentStage():setFocus( self, nil )
      self.isFocus = false
    end

  end

 return true
end

pedra:addEventListener( "touch", pedra )

-- CRIAR CENA
function scene:create( event ) 
    local sceneGroup = self.view
 
    local bg = display.newImage(sceneGroup, 'assets/bg0.png');
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

    local bg1 = display.newImage(sceneGroup, 'assets/cena6.png');
    bg1.x = display.contentCenterX
    bg1.y = display.contentCenterY-140

    -- BOTÃO AVANÇAR
    local button = display.newImage(sceneGroup, 'assets/botaoavancar.png', _W -30, _H - 60, 20, 20)
    button:addEventListener("tap", gotoScene07)

    -- BOTÃO VOLTAR
    local button2 = display.newImage(sceneGroup, 'assets/botaovoltar.png', _W / 11, _H - 60, 20, 20)
    button2:addEventListener("tap", gotoScene05)

end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase

    sceneGroup:insert(grupodepedras)

 
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

