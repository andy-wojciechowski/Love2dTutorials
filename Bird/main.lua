local Player = require "entities.player"
local Tube = require "entities.tube"

local playAreaWidth = 300
local playAreaHeight = 388
local pipeSpaceHeight = 100
local pipeSpaceMin = 54
local world = love.physics.newWorld(0, 9.81 * 64, true)
local playerInstance = Player:new(world)
local tubes = {}

function love.load()
    score = 0
    love.physics.setMeter(64)
    world:setCallbacks(beginContact)
    createDefaultTubes()
end

function love.update(dt)
    world:update(dt)
    jump = love.keyboard.isDown('space')
    playerInstance:updatePosition(jump)

    x, y = playerInstance.body:getPosition()
    
    if(y < playAreaHeight) then
        love.load()
    end

    updateScoreIfNecessary()
    printCurrentScore()

    needToResetTubes = false
    for i, tube in ipairs(tubes) do
        x, y = tube.upperBody:getPosition()
        if(x < 0) then
            needToResetTubes = true
        end
    end

    if needToResetTubes then resetCurrentTubes() end
end

function love.draw()
    love.graphics.setColor(.14, .36, .46)
    love.graphics.rectangle('fill', 0, 0, playAreaWidth, playAreaHeight)
    playerInstance:draw()
    for i, tube in ipairs(tubes) do
        tube:draw()
    end
end

function createDefaultTubes()
    tubes[1] = Tube:new(100, 62, 54, playAreaHeight, generateRandomSpaceHeight(), world)
    tubes[2] = Tube:new(200, 62, 54, playAreaHeight, generateRandomSpaceHeight(), world)
end

function beginContact(a, b, coli)
    love.load()
end

function printCurrentScore()
    love.graphics.print(score, 15, 30)
end

function updateScoreIfNecessary()
    for i, tube in ipairs(tubes) do
        tubeX, tubeY = tube.upperBody:getPosition()
        playerX, playerY = playerInstance.body:getPosition()
        if(tubeX < playerX) then
            score = score + 1
        end
    end
end

function generateRandomSpaceHeight()
    return love.math.random(pipeSpaceMin, playAreaHeight - pipeSpaceHeight - pipeSpaceMin)
end

function resetCurrentTubes()
    tubes[1] = tubes[2]
    tubes[2] = Tube:new(200, 62, 50, playAreaHeight, generateRandomSpaceHeight(), world)
end