local class = require "libs.middleClass"

local Player = class("Player")

function Player:initialize(world)
    self.body = love.physics.newBody(world, 62, 200, "dynamic")
    self.shape = love.physics.newRectangleShape(30, 25)
    self.fixture = love.physics.newFixture(self.body, self.shape, 1)
    self.body:setLinearVelocity(15, 0)
end

function Player:draw()
    love.graphics.setColor(.87, .84, .27)
    love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
end

function Player:updatePosition(jump)
    if jump then
        self.body:applyForce(0, -1500)
    end
end

return Player