Object = Object or require("lib/classic")
Linterna = Object:extend()

function Linterna:new()
    self.image = love.graphics.newImage("src/sprites/Linterna.png")
    self.width = self.image.getWidth(self.image)
    self.height = self.image.getHeight(self.image)
end
function Linterna:update()
    self.x = love.mouse.getX()-self.width/2
    self.y = love.mouse.getY()-self.height/2
end
function Linterna:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.image, self.x, self.y)
end

function Linterna:randomize()
    return math.random(2)
end

return Linterna