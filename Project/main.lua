Vector = Vector or require "lib/vector"
Object = Object or require "lib/object"
Actor = Actor or require "src/actor"
Mouse = Mouse or require "src/mouse"
Linterna = Linterna or require "src/linterna"

local GameOver = require "src.gameOver"
local Menu = require "src.menu"
local ShowScore = ShowScore or require "src/showScore"
local Background = Background or require "src/background"
local UI = require "src.ui"  -- Nueva clase para la interfaz
local LoadingScreen = LoadingScreen or require "src/loadingScreen"

local Spawner = Spawner or require("src/spawner")
local Sprite = Sprite or require("src/sprite")

local game = {state = "loadingScreen"}

useLantern = false

function love.load(arg)
    if arg[#arg] == "vsc_debug" then require("lldebugger").start() end

    w, h = love.graphics.getDimensions()
    local font = love.graphics.newFont("pong.ttf", 32)

    love.graphics.setFont(font)

    actorList = {}
    spawner = Spawner()

    table.insert(actorList, spawner)

    mouse = Mouse()
    menu = Menu:new()
    lS = LoadingScreen(game)
    go = GameOver(font)
    background = Background()
    sc = ShowScore()
    ui = UI(font, game)  -- Inicializamos la interfaz de usuario
    linterna = Linterna()
    
end

function love.update(dt)

    if game.state == "loadingScreen" then
        lS:update(dt)
    end

    if game.state == "menu" then
        menu:keypressed()
    elseif game.state == "playing" then
        sc:loadScores()
        mouse:update(dt)
        background:update(dt)
        ui:update(dt)  -- Actualizamos la interfaz
        linterna:update(dt)
        for k, v in ipairs(actorList) do
            v:update(dt)
        end
    elseif game.state == "gameOver" then
        go:keypressed(dt)
        go:update(dt)
    end
end

function love.draw()
    if game.state == "loadingScreen" then
        lS:draw()
    end
    if game.state == "menu" then
        menu:draw()
    elseif game.state == "showControls" then
        love.graphics.clear()
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("Controles del Juego", 0, 50, love.graphics.getWidth(), "center")
        love.graphics.printf(menu.message, 50, 150, love.graphics.getWidth() - 100, "left")
        love.graphics.printf("Presiona ESC para volver al menu", 0, love.graphics.getHeight() - 50, love.graphics.getWidth(), "center")
    elseif game.state == "playing" then       
        background:draw()
        for kk, vv in ipairs(actorList) do
            vv:draw()
        end
        if useLantern then
        linterna:draw()
        end
        ui:draw()  -- Dibujamos la interfaz
        love.graphics.setColor(1, 1, 1)
        
        mouse:draw()
    elseif game.state == "gameOver" then
        go:draw()
    end
end

function love.keypressed(key)
  if game.state == "menu" then
      menu:keypressed(key, game)
  elseif game.state == "showControls" then
      if key == "escape" then
          game.state = "menu"
          menu:RestartMusic()
          menu.message = ""
      end
  elseif game.state == "playing" or game.state == "gameOver" then
    if key == "escape" then
        if game.state == "gameOver" then 
            game.state = "menu"
            menu:RestartMusic()
            menu.message = ""
            spawner = Spawner()
            table.insert(actorList, spawner)

            sc:savePoints(ui:getPoints())
            ui:resetPoints()

            if linterna.randomize() == 1 then
                useLantern = true
            else 
                useLantern = false
            end
            ui:ChangeChosenDraw()
            ui:ResetTimer()
            go:onExit()
        end
      if game.state == "playing" then
        if key == "escape" then
            ui:pauseUnpause()
        end
      end
    end
  end
end
