Player = require "entities.player"

gravity = -400
local playerInstance = Player:new()

function love.update(dt)
    jump = love.keyboard.isDown('space')
    playerInstance:updatePosition(jump, gravity, dt)
end

function love.draw()
    love.graphics.setColor(.14, .36, .46)
    love.graphics.rectangle('fill', 0, 0, 300, 388)
    playerInstance:draw()
end