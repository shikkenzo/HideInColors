local Object = Object or require("lib/classic")
local Sprite = Sprite or require("src/sprite")
local Spawner = Object:extend()
local spawnMax
local totalFruits
local chosenFruit

function Spawner:new()
    math.randomseed(os.time())
    self.fruits = {}
    self.spawnList = {}

    local spawnMax = 20
    local totalFruits = 200

    for i = 1, 9 do
        self.fruits[i] = Sprite(i, 0, 0)
    end
    self:chooseFruit(true)

    for k, v in ipairs(self.fruits) do
        for i = 1, spawnMax do
        self.spawnList[i+(k-1)*spawnMax] = Sprite(nil, nil, nil, true, v)
        end  
    end

    for i = 1, totalFruits do
        self:chooseFruit(false)
    end

end
function Spawner:update(dt)
end
function Spawner:draw()
end


function Spawner:chooseFruit(remove)
    if remove then
        local randomNum = math.random(1, #self.fruits)
        table.insert(actorList, self.fruits[randomNum])
        self.fruits[randomNum].x = math.random(150 + self.fruits[randomNum].width, w-self.fruits[randomNum].width)
        self.fruits[randomNum].y = math.random(self.fruits[randomNum].height, h-self.fruits[randomNum].height)
        chosenFruit = self.fruits[randomNum]
        table.remove(self.fruits, randomNum)
    else 
        local randomNum = math.random(1, #self.spawnList)
        table.insert(actorList, self.spawnList[randomNum])
        
        self.spawnList[randomNum].x = math.random(150 + self.spawnList[randomNum].width, w-self.spawnList[randomNum].width)
        self.spawnList[randomNum].y = math.random(self.spawnList[randomNum].height, h-self.spawnList[randomNum].height)
    end
    
end

function Spawner:getChosenFruit()
    return chosenFruit
end

return Spawner