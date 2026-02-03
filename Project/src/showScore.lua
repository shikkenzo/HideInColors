local ShowScore = Object:extend()

function ShowScore:new()
    self.font = font
    self.name = ""
    self.scores = {}
end

function ShowScore:savePoints(points)
    love.filesystem.append("bestScores.txt", points .. "\n")
    self:loadScores()  
end

function ShowScore:loadScores()
  self.scores = {}
    if love.filesystem.getInfo("bestScores.txt") then
        
        local lines = {}
        for line in love.filesystem.lines("bestScores.txt") do
            table.insert(lines, line)
        end
        
        
        local count = #lines
        for i = math.max(1, count - 3), count do
            table.insert(self.scores, 1, lines[i])  
        end
    end
end

function ShowScore:show()
    love.graphics.setColor(0, 0, 0)
    local yPos = 355

    for i, score in ipairs(self.scores) do
        love.graphics.print("LAST" .. i .. " " .. score, 33, yPos, 0, 1, 1)
        yPos = yPos + 55
    end
end

return ShowScore
