local Menu = {}
Menu.__index = Menu

local GameOver = GameOver or require "src/gameOver"

function Menu:new()
    local self = setmetatable({}, Menu)
    self.options = {"Play", "Controls", "Exit"}
    self.selectedOption = 1
    self.message = ""  -- Variable para el mensaje de controles en pantalla

    -- Música
    self.music = love.audio.newSource("src/sounds/IntroMusic.wav", "stream") 
    self.music:setLooping(true)
    self.music:setVolume(0.01)
    love.audio.play(self.music)

    Sprite1 = love.graphics.newImage("src/sprites/Fruta_1.png")
    Sprite2 = love.graphics.newImage("src/sprites/Fruta_2.png")
    Sprite3 = love.graphics.newImage("src/sprites/Fruta_3.png")
    Sprite4 = love.graphics.newImage("src/sprites/Fruta_4.png")
    Sprite5 = love.graphics.newImage("src/sprites/Fruta_5.png")
    Sprite6 = love.graphics.newImage("src/sprites/Fruta_6.png")
    Sprite7 = love.graphics.newImage("src/sprites/Fruta_7.png")
    Sprite8 = love.graphics.newImage("src/sprites/Fruta_8.png")
    Sprite9 = love.graphics.newImage("src/sprites/Fruta_9.png")

    return self
end

function Menu:draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("Hide In Colors", 0, love.graphics.getHeight() / 4, love.graphics.getWidth(), "center")
    
    -- Dibujar opciones del menú
    for i, option in ipairs(self.options) do
        local color = i == self.selectedOption and {0, 0.690, 0.549} or {0, 0, 0}
        love.graphics.setColor(color)
        love.graphics.printf(option, 0, love.graphics.getHeight() / 2 + (i * 40)-115, love.graphics.getWidth(), "center")
    end

    -- Mostrar el mensaje de cómo jugar si el estado es "showControls"
    if self.selectedOption == 3 then  -- Solo muestra el mensaje si la opción "Controls" está seleccionada
        love.graphics.setColor(0, 0, 0)
        love.graphics.printf(self.message, 50, love.graphics.getHeight() / 2 + 150, love.graphics.getWidth() - 100, "left")
    end

    love.graphics.setColor(1, 1, 1)  -- Restablecer el color a negro

    love.graphics.draw(Sprite4, 250, 350, 0, 0.5, 0.5)
    love.graphics.draw(Sprite7, -90, 280, 0, 0.35, 0.35)
    love.graphics.draw(Sprite6, 100, 400, 0, 0.35, 0.35)
    love.graphics.draw(Sprite9, -90, 320, 0, 0.4, 0.4)
    love.graphics.draw(Sprite8, 130, 440, 0, 0.6, 0.6)
    love.graphics.draw(Sprite2, 370, 320, 0, 0.8, 0.8)
    love.graphics.draw(Sprite1, -200, 300, 0, 1, 1)
    love.graphics.draw(Sprite5, 330, 430, 0, 0.5, 0.5)
    love.graphics.draw(Sprite3, 550, 300, 0, 0.8, 0.8)

    if love.keyboard.isDown("space") then
        love.graphics.print("Joan Forcadell",650,515,0,0.5)
        love.graphics.print("Ricardo Fuster",650,530,0,0.5)
        love.graphics.print("Oscar Garcia",650,545,0,0.5)
        love.graphics.print("Enzo Hamblot",650,560,0,0.5)
        love.graphics.print("Adrian Valero",650,575,0,0.5)
    end
    

end

function Menu:keypressed(key, game)

    if key == "up" then
        self.selectedOption = self.selectedOption - 1
        if self.selectedOption < 1 then self.selectedOption = #self.options end
    elseif key == "down" then
        self.selectedOption = self.selectedOption + 1
        if self.selectedOption > #self.options then self.selectedOption = 1 end
    elseif key == "return" then
        if self.selectedOption == 1 then
            game.state = "playing"
            self.message = ""  -- Limpiar el mensaje al jugar
        elseif self.selectedOption == 3 then
            love.event.quit()
        elseif self.selectedOption == 2 then
            game.state = "showControls"  -- Cambiar el estado a mostrar controles
            self.message = "Encuentra la verdura unica entre la multitud. " ..
            "Ten cuidado de no equivocarte o tu tiempo disminuira.\n\nControles:\n" ..
            "- Raton para moverte por la pantalla\n" ..
            "- Click izquierdo para seleccionar la imagen"
        end
        love.audio.pause()

    end
end


function Menu:RestartMusic()
    love.audio.play(self.music)
end

return Menu