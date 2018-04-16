local class = require "libs.middleClass"

local Tube = class('Tube')

function Tube:initialize(x, y, width, spaceHeight)
    self.x = x
    self.y = y
    self.width = width
    self.spaceHeight = spaceHeight
end

function Tube:draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.y)
    love.graphics.rectangle('fill', self.x, self.y + self.spaceHeight, self.width, self.y)
end

return Tube