local Player = require "entities.player"
local Tube = require "entities.tube"

--local world = love.physics.newWorld(0, 9.81 * 64, true)
local playerInstance = Player:new(world)
local tubes = {}

function love.load()
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 9.81*64, true)
    createDefaultTubes()
end

function love.update(dt)
    world:update(dt)
    jump = love.keyboard.isDown('space')
    playerInstance:updatePosition()
    for i = 1, 2 do
        tubes[i]:draw()
    end
end

function love.draw()
    love.graphics.setColor(.14, .36, .46)
    love.graphics.rectangle('fill', 0, 0, 300, 388)
    playerInstance:draw()
end

function createDefaultTubes()
    tubes[1] = Tube:new(100, 62, 388, 30, world)
    tubes[2] = Tube:new(200, 62, 388, 30, world)
end