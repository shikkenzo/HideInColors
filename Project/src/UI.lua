local UI = Object:extend()
local Spawner = Spawner or require("src/spawner")
local Object = require "lib.object"
local Actor = Actor or require "src/actor"

local GameOver = GameOver or require "src/gameOver"
local ShowScore = ShowScore or require "src/showScore"

function UI:new(font, game)
    self.SonidoReloj = love.audio.newSource("src/sounds/Reloj.wav", "stream")
    self.House = love.audio.newSource("src/sounds/House.wav", "stream")

    self.SonidoReloj:setVolume(0.5)
    self.House:setVolume(0.05)
    self.font = font
    self.timer = 40
    self:loadAssets()
    self:setBackgroundColor()
    self.game = game
    UI:pauseUnpause()
    self.points = 0
    self.countPoints = 0
end

function UI:loadAssets()
    --[[self.images = {
        fruta1 = love.graphics.newImage("src/sprites/Fruta_1.png"),
        fruta2 = love.graphics.newImage("src/sprites/Fruta_2.png"),
        fruta3 = love.graphics.newImage("src/sprites/Fruta_3.png"),
        fruta4 = love.graphics.newImage("src/sprites/Fruta_4.png"),
        fruta5 = love.graphics.newImage("src/sprites/Fruta_5.png"),
        fruta6 = love.graphics.newImage("src/sprites/Fruta_6.png"),
        fruta7 = love.graphics.newImage("src/sprites/Fruta_7.png"),
        fruta8 = love.graphics.newImage("src/sprites/Fruta_8.png"),
        fruta9 = love.graphics.newImage("src/sprites/Fruta_9.png"),
    }]]

    local fruitString = "src/sprites/Fruta_" .. string.sub(spawner.getChosenFruit().spritePath, 24, 24) .. ".png"
    fruit = love.graphics.newImage(fruitString)

end

function UI:ChangeChosenDraw()
    local fruitString = "src/sprites/Fruta_" .. string.sub(spawner.getChosenFruit().spritePath, 24, 24) .. ".png"
    fruit = love.graphics.newImage(fruitString)

end

function UI:setBackgroundColor()
    local r, g, b = love.math.colorFromBytes(212, 237, 237)
    love.graphics.setBackgroundColor(r, g, b)
end

function UI:update(dt)
    if self.countPoints == 1 then
        actorList = {}
        spawner = Spawner()
        table.insert(actorList, spawner)


        if useLantern then
            useLantern = false
        else 
            useLantern = true
        end

        UI:ChangeChosenDraw()
        self.countPoints = 0
    end
    self:updateTimer(dt)
end

function UI:pauseUnpause()
    if self.pause == false then
       self.pause = true
    else 
        self.pause = false
    end

end

function UI:updateTimer(dt)
    if self.timer > 40 then
        self.timer = 40
    end

    if self.timer > 0 and self.pause == false then
        self.timer = self.timer - dt
        love.audio.play(self.SonidoReloj)
        love.audio.play(self.House)
    end
    if self.timer <= 0 then
        self.timer = 0

        love.audio.stop(self.House)
        love.audio.stop(self.SonidoReloj)
        UI:resetPoints()
        actorList = {}
        self.game.state = "gameOver"
        GameOver:StartMusic()
    end
end

function UI:draw()
    if self.pause then
        love.graphics.setColor(0.150, 0.150, 0.150)
        love.graphics.rectangle("fill", 000, 0, 800, 600)
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("PAUSE", 300, 240, 0, 2.2, 2.2)
        love.graphics.print("Press escape", 290, 330, 0, 1, 1)
    else     
      love.graphics.setColor(0.251, 0.443, 0.416)
      love.graphics.rectangle("fill", 0, 0, 200, love.graphics.getHeight())

      love.graphics.setColor(0,0,0)
      love.graphics.rectangle("fill", 197, 0, 5, love.graphics.getHeight())

      love.graphics.setColor(0.753, 0.863, 0.847)
      love.graphics.rectangle("fill", 20, 20, 160, 160)
      love.graphics.setColor(0, 0, 0)
      love.graphics.rectangle("line", 20, 20, 160, 160)
      love.graphics.setColor(1, 1, 1)
      love.graphics.draw(fruit, 25, 22, 0, 0.3)

      love.graphics.setColor(1, 1, 1)
      local timerText = string.format("%.1f", self.timer)
      love.graphics.print(timerText, 65 - self.font:getWidth(timerText) / 2, 200, 0, 2, 2)

      self:drawScoreSections()

    end
end

function UI:ModifyTime(positive)

    if positive then
        self.timer = self.timer +7.5
    else
        self.timer = self.timer -2.5
    end

end

function UI:ResetTimer()
    self.timer = 25
end

function UI:MorePoints()
    self.points = self.points +1
end

function UI:getPoints()
    return self.points
end

function UI:resetPoints()
    self.points = 0
end

function UI:CountPoints(reset)
    if reset then
        self.countPoints = 0
    else
        self.countPoints = self.countPoints + 1
    end 
end

function UI:drawScoreSections()
    local colors = {
        {0.965, 0.447, 0.502},
        {0.753, 0.424, 0.518},
        {0.424, 0.337, 0.482},
        {0.337, 0.384, 0.482},
    }

    local yPos = 300
    love.graphics.setColor({0.973, 0.694, 0.584})
    love.graphics.rectangle("fill", 20, yPos, 160, 35)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("line", 20, yPos, 160, 35)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("YOU ".. self.points, 33, yPos, 0, 1, 1)
    yPos = yPos + 55


    for i, color in ipairs(colors) do
        love.graphics.setColor(color)
        love.graphics.rectangle("fill", 20, yPos, 160, 35)
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("line", 20, yPos, 160, 35)
        love.graphics.setColor(0, 0, 0)
        yPos = yPos + 55
    end

    sc:show()

    love.graphics.setColor(0.251, 0.443, 0.416)
    love.graphics.rectangle("fill", 0, 570, 180, 50)
  


end

return UI
