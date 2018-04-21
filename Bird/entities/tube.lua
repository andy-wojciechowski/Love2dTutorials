local class = require "libs.middleClass"

local Tube = class('Tube')

function Tube:initialize(x, y, width, height, spaceHeight, world)
    self.upperBody = love.physics.newBody(world, x, y, "dynamic")
    self.upperShape = love.physics.newRectangleShape(width, height)
    self.lowerBody = love.physics.newBody(world, x, y, "dynamic")
    self.lowerShape = love.physics.newRectangleShape(width, height + spaceHeight)
    self.upperBody:setLinearVelocity(-15, 0)
    self.lowerBody:setLinearVelocity(-15, 0)
end

function Tube:draw()
    love.graphics.setColor(.37, .82, .28)
    love.graphics.polygon("fill", self.upperBody.getWorldPoints(self.upperShape.getPoints()))
    love.graphics.polygon("fill", self.lowerBody.getWorldPoints(self.lowerShape.getPoints()))
end

return Tube