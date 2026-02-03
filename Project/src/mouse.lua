local Mouse = Actor:extend() 
local Actor = Actor or require "src/actor"
local UI = UI or require "src/ui"

local Spawner = Spawner or require "src/spawner"

function Mouse:new()
    self.spriteNormal = love.graphics.newImage("src/sprites/NormalCursor.png")
    self.spriteClick = love.graphics.newImage("src/sprites/ClikedCursor.png")
    self.Correcto = love.audio.newSource("src/sounds/Correcto.wav", "stream")
    self.Error = love.audio.newSource("src/sounds/Error.wav", "stream")

    self.Correcto:setVolume(0.5)
    self.Error:setVolume(0.05)

    self.x = 0
    self.y = 0
    self.sprite = self.spriteNormal
    self.clicked = false
    self.hasClicked = false   
end

function Mouse:update(dt)
    love.mouse.setVisible(false)
    self.x, self.y = love.mouse.getPosition()

    if love.mouse.isDown(1) then
        self.sprite = self.spriteClick
        
        if not self.hasClicked then 
            self.clicked = true
            self.hasClicked = true  

            if self:checkCollision(spawner.getChosenFruit()) then
                self:PlayMusic(1)
                ui:ModifyTime(true)  
                ui:MorePoints()
                ui:CountPoints(false)
            else
                self:PlayMusic(2)
                ui:ModifyTime(false)  
            end
        end
    else
        self.sprite = self.spriteNormal
        self.clicked = false

        if self.hasClicked then
            self.hasClicked = false  
        end
    end
end

function Mouse:draw()
    love.graphics.draw(self.sprite, self.x, self.y, 0, 0.5)
end

function Mouse:PlayMusic(num)
    if num == 1 then
        love.audio.play(self.Correcto)
    else
        love.audio.play(self.Error)
    end
end

return Mouse
