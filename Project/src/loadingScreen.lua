local Object = require "lib.object"
local Actor = Actor or require "src/actor"

local LoadingScreen = Object:extend()

function LoadingScreen:new(game)
  self.image = love.graphics.newImage("src/sprites/fruitCodeF.png")
  self.timer = 0
  self.final = 5.25
  self.game = game
  self.sx = 0
  self.sy = 0
end

function LoadingScreen:update(dt)
    self.timer = self.timer + dt

    if self.sx < 0.75 then
        self.sx = self.sx + self.timer * 0.1 * dt
        self.sy = self.sy + self.timer * 0.1 * dt
    end

    if self.timer > self.final then
        self.timer = 0
        self.game.state = "menu"
    end

end

function LoadingScreen:draw(w, h)

  love.graphics.setBackgroundColor(0.831, 0.929, 0.918) 

    local xx, yy = love.graphics.getWidth() / 2, love.graphics.getHeight() / 2
    local rr = 0 
    local ox = self.image:getWidth()/2
    local oy = self.image:getHeight()/2

  love.graphics.draw(self.image, xx, yy, rr, self.sx, self.sy, ox, oy)
end

return LoadingScreen