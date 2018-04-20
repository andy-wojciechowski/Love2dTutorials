local class = require "libs.middleClass"

local Player = class("Player")

function Player:initialize(world)
    self.body = love.physics.newBody(world, 62, 200, "dynamic")
    self.shape = love.physics.newRectangleShape(30, 25)
    self.fixture = love.physics.newFixture(self.body, self.shape, 1)
end

function Player:draw()
    love.graphics.setColor(.87, .84, .27)
    love.graphics.polygon('fill', self.body.getWorldPoints(self.shape.getPoints()))
end

function Player:updatePosition()
    if jump then
        self.body.applyForce(0, 400)
    end
end

function Player:isCollidingWithTube(tube)
    local position = self.body.getPosition()
    --top porition
    if position.y < tube.y then
        --left edge
        if position.x + self.shape.getWidth() == tube.x then
            return true
        --right edge
        elseif position.x == tube.x + tube.width then
            return true
        end
    --bottom portion
    else
        --left edge
        if position.x + self.width == tube.x then
            return true
        elseif position.x == tube.x + tube.width then
            return true
        end
    end
    return false
end

return Player