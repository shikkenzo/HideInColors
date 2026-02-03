
local Background = Object:extend()

function Background:new()
end


function Background:update()
end


function Background:draw()
    love.graphics.setColor(0.702, 0.867, 0.871)
    love.graphics.circle( "fill", 290, 50, 230, 460)
    love.graphics.circle( "fill", 890, 480, 120, 400)


    love.graphics.setColor(0.690, 0.847, 0.871)
    love.graphics.rectangle( "fill", 530, 0, 230, 460)
    love.graphics.rectangle( "fill", 200, 300, 230, 460)
    love.graphics.rectangle( "fill", 0, 0, 430, 230)
    love.graphics.rectangle( "fill", 800, 0, 160, 100)
    love.graphics.setColor(0.690, 0.847, 0.871)
    love.graphics.rectangle( "fill", 830, 210, 160, 140)
    love.graphics.setColor(0.690, 0.871, 0.804)
    love.graphics.rectangle( "fill", 600, 530, 3000, 140)
    love.graphics.setColor(0.690, 0.871, 0.804)
    love.graphics.rectangle( "fill", 440, 0, 60, 70)
    love.graphics.setColor(0.702, 0.867, 0.871)
    love.graphics.circle( "fill", 200, 670, 230, 460)
    love.graphics.setColor(0.902, 0.953, 0.961)
    love.graphics.rectangle( "fill", 230, 520, 90, 60)


    love.graphics.setColor(0.761, 0.882, 0.898)
    love.graphics.rectangle( "fill", 400, 0, 60, 160)
    love.graphics.rectangle( "fill", 550, 400, 160, 160)
    love.graphics.setColor(0.690, 0.871, 0.804)
    love.graphics.rectangle( "fill", 200, 30, 100, 400)
    love.graphics.setColor(0.761, 0.882, 0.898)
    love.graphics.rectangle( "fill", 800, 400, 480, 180)
    love.graphics.rectangle( "fill", 350, 450, 160, 160)
    love.graphics.setColor(0.761, 0.882, 0.898)
    love.graphics.setColor(0.690, 0.871, 0.804)
    love.graphics.rectangle( "fill", 900, 50, 200, 260)
    love.graphics.rectangle( "fill", 600, 90, 200, 160)
    love.graphics.rectangle( "fill", 370, 240, 100, 140)

    love.graphics.setColor(0.902, 0.953, 0.961)
    love.graphics.rectangle( "fill", 580, 30, 90, 50)
    love.graphics.rectangle( "fill", 780, 380, 60, 60)
    love.graphics.setColor(0.690, 0.871, 0.804)
    love.graphics.rectangle( "fill", 380, 460, 60, 90)
    love.graphics.setColor(0.902, 0.953, 0.961)
    love.graphics.rectangle( "fill", 680, 260, 40, 60)
    love.graphics.rectangle( "fill", 280, 60, 100, 60)
    love.graphics.rectangle( "fill", 430, 230, 60, 70)
end

return Background