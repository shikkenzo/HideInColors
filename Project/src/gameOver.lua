local Object = require "lib.object"

local GameOver = Object:extend()

function GameOver:new(font) 
  self.font = font
  self.text = "Game Over"
  self.continue = "Press escape to menu"

  -- Dades per el moviment del titol
  self.textX = 0 - w
  self.finalX = w/3
  self.textY = 0 - h/2
  self.finalY = h/4
  self.speed = 300

  -- Music thingies (MUSIC FROM SADNESS AND SORROW NARUTO)
  self.music = love.audio.newSource("src/sounds/SadMusic.wav", "stream")
  self.music:setLooping(true)
  love.audio.setVolume(0.6)
end

function GameOver:update(dt)
  
  if self.textX < self.finalX then
    self.textX = self.textX + self.speed * dt
  end

  if self.textY < self.finalY then
    self.textY = self.textY + self.speed * dt
  end

end

function GameOver:draw()

  love.graphics.setColor(0.863, 0.380, 0.380)
  love.graphics.rectangle("fill", 000, 0, 800, 600)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Game Over", 140, 250, 0, 3, 3)
end

function GameOver:keypressed(key, game)
  if key == "escape" then
    game.state = "menu"
  end
end

function GameOver:onExit()
  self.textX = 0 - w
  self.textY = 0 -h/2
  love.audio.stop()
  menu:RestartMusic()
end

function GameOver:StartMusic()
  love.audio.play(love.audio.newSource("src/sounds/SadMusic.wav", "stream"))
end

return GameOver
