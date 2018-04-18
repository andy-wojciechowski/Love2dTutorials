local Player = require "entities.player"
local Tube = require "entities.tube"

local gravity = -400
local playerInstance = Player:new()
local tubes = {}

function love.load()
    createDefaultTubes()
end

function love.update(dt)
    jump = love.keyboard.isDown('space')
    playerInstance:updatePosition(jump, gravity, dt)
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
    tubes[1] = Tube:new(100, 62, 388, 30)
    tubes[2] = Tube:new(200, 62, 388, 30)
end