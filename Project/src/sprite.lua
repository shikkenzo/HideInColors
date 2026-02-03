local Object = Object or require("lib/classic")
local Sprite = Object:extend()

function Sprite:new(num, x, y, copy, sprite)
    if copy then 
        self.image = sprite.image
        self.x = sprite.x
        self.y = sprite.y
    else
        self.spritePath = "src/sprites/SpriteFruta" .. num .. ".png"
        self.image = love.graphics.newImage(self.spritePath)
        self.x = x
        self.y = y
    end
    self.width = self.image.getWidth(self.image)
    self.height = self.image.getHeight(self.image)

    self.speed = 25
    self.angle = math.random() * 2 * math.pi
end
function Sprite:update(dt)
    self.x = self.x + self.speed * math.cos(self.angle) * dt
    self.y = self.y + self.speed * math.sin(self.angle) * dt

    if self.x < 202 then
        self.x = 202
        self.angle = math.pi - self.angle 
    end
  
    if self.x + self.width > w then 
        self.x = w - self.width 
        self.angle = math.pi - self.angle 
    end
  
    if self.y < 0 then
        self.y = 0 
        self.angle = -self.angle 
    end
  
    if self.y + self.height > h then
        self.y = h - self.height
        self.angle = -self.angle
    end
end
function Sprite:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, 1, 1)
end

return Sprite