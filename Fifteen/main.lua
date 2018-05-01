local grid = {}
local current16YPosition = -1
local current16XPosition = -1

function love.load()
    love.window.setTitle("Fifteen")
    love.graphics.setNewFont(30)
    initializeGrid()
end

--TODO: Use this method to finish this
function getInitialValue(x, y)
    return x + ((y - 1) * 4)
end

function love.draw()
    local peiceSize = 100
    local peiceDrawSize = peiceSize - 1
    for y = 1, 4 do
        for x = 1, 4 do
            love.graphics.setColor(0.58, 0, 0.83)
            if grid[y][x] == 16 then 
                love.graphics.setColor(0, 0, 0) 
                current16YPosition = y
                current16XPosition = x
            end
            love.graphics.rectangle('fill', 
                                    (x - 1) * peiceSize, 
                                    (y - 1) * peiceSize, 
                                    peiceDrawSize, 
                                    peiceDrawSize)
            if(grid[y][x] ~= 16) then
                love.graphics.setColor(1, 1, 1)
                love.graphics.print(grid[y][x], (x - 1) * peiceSize, (y - 1) * peiceSize)
            end
        end
    end
end

function love.keypressed(key)
    if key == 'down' then
        if current16YPosition - 1 > 0 then
            local numberToSwap = grid[current16YPosition - 1][current16XPosition]
            grid[current16YPosition - 1][current16XPosition] = grid[current16YPosition][current16XPosition]
            grid[current16YPosition][current16XPosition] = numberToSwap
        end
    elseif key == 'up' then
        if current16YPosition + 1 <= 4 then
            local numberToSwap = grid[current16YPosition + 1][current16XPosition]
            grid[current16YPosition + 1][current16XPosition] = grid[current16YPosition][current16XPosition]
            grid[current16YPosition][current16XPosition] = numberToSwap
        end
    elseif key == 'left' then
        if current16XPosition + 1 <= 4 then
            local numberToSwap = grid[current16YPosition][current16XPosition + 1]
            grid[current16YPosition][current16XPosition + 1] = grid[current16YPosition][current16XPosition]
            grid[current16YPosition][current16XPosition] = numberToSwap
        end
    elseif key == 'right' then
        if current16XPosition - 1 > 0 then
            local numberToSwap = grid[current16YPosition][current16XPosition - 1]
            grid[current16YPosition][current16XPosition - 1] = grid[current16YPosition][current16XPosition]
            grid[current16YPosition][current16XPosition] = numberToSwap 
        end    
    end
end

function initializeGrid()
    for y = 1, 4 do
        row = {}
        for x = 1, 4 do
            table.insert(row, x + ((y - 1) * 4))
        end
        table.insert(grid, row)
    end
end