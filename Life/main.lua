local lifeTable = {}
local lifeChance = 0.5

function love.load()
    love.window.setTitle("Game of Life")
    for y = 1, 50 do
        lifeTable[y] = {}
        for x = 1, 70 do
            lifeTable[y][x] = false
        end
    end
    randomizeCells()
end

function love.draw()
    for y = 1, 50 do
        for x = 1, 70 do
            local cellSize = 5
            local cellDrawSize = cellSize - 1
            
            if(lifeTable[y][x]) then
                love.graphics.setColor(1, 0, 1)
            else
                love.graphics.setColor(1, 1, 1)
            end

            love.graphics.rectangle(
                'fill',
                (x - 1) * cellSize,
                (y - 1) * cellSize,
                cellDrawSize,
                cellDrawSize
            )
        end
    end
end

function love.keypressed()
    for y = 1, 50 do
        for x = 1, 70 do
            neighbors = getCellNeighbors(y, x)
            numberOfAliveNeighbors = 0
            for i, e in ipairs(neighbors) do
                if e then
                    numberOfAliveNeighbors = numberOfAliveNeighbors + 1
                end
            end
            
            if numberOfAliveNeighbors == 3 then
                lifeTable[y][x] = true
            else
                lifeTable[y][x] = (numberOfAliveNeighbors >= 2) and (numberOfAliveNeighbors <= 3) and lifeTable[y][x]
            end
        end
    end
end

function randomizeCells()
    for y = 1, 50 do
        for x = 1, 70 do
            if(math.random() < lifeChance) then
                lifeTable[y][x] = true
            end
        end
    end
end

function getCellNeighbors(y, x)
    local result = {}
    
    local northIndex = y - 1
    local southIndex = y + 1
    local westIndex = x - 1
    local eastIndex = x + 1

    --Gather the 8 neighbors
    local nwNeighbor = nil
    local nNeighbor = nil
    local neNeighbor = nil
    local wNeighbor = nil
    local eNeighbor = nil
    local swNeighbor = nil
    local sNeighbor = nil
    local seNeighbor = nil

    if(northIndex >= 1 and northIndex <= 50) then
        nNeighbor = lifeTable[northIndex][x]
        if(westIndex >= 1 and westIndex <= 70) then nwNeighbor = lifeTable[northIndex][westIndex] end
        if(eastIndex >= 1 and eastIndex <= 70) then neNeighbor = lifeTable[northIndex][eastIndex] end
    end

    if(westIndex >= 1 and westIndex <= 70) then wNeighbor = lifeTable[y][westIndex] end
    if(eastIndex >= 1 and eastIndex <= 70) then eNeighbor = lifeTable[y][eastIndex] end

    if(southIndex >= 1 and southIndex <= 50) then
        sNeighbor = lifeTable[southIndex][x]
        if(westIndex >= 1 and westIndex <= 70) then swNeighbor = lifeTable[southIndex][westIndex] end
        if(eastIndex >= 1 and eastIndex <= 70) then seNeighbor = lifeTable[southIndex][eastIndex] end
    end

    --Add the neighbors if they exist
    if nwNeighbor ~= nil then table.insert(result, nwNeighbor) end
    if nNeighbor ~= nil then table.insert(result, nNeighbor) end
    if neNeighbor ~= nil then table.insert(result, neNeighbor) end
    if wNeighbor ~= nil then table.insert(result, wNeighbor) end
    if eNeighbor ~= nil then table.insert(result, eNeighbor) end
    if swNeighbor ~= nil then table.insert(result, swNeighbor) end
    if sNeighbor ~= nil then table.insert(result, sNeighbor) end
    if seNeighbor ~= nil then table.insert(result, seNeighbor) end
    
    return result
end