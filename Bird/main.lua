Player = require "entities.player"

newPLayer = Player:new()
gravity = -400

function love.load()

end

function love.update(dt)
    jump = love.keyboard.isDown('space')
    newPLayer:update(jump, gravity, dt)
end

function love.draw()
    love.graphics.setColor(.14, .36, .46)
    love.graphics.rectangle('fill', 0, 0, 300, 388)
    newPlayer:draw()
end