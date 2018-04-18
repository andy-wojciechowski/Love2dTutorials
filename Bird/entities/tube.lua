local class = require "libs.middleClass"

local Tube = class('Tube')

function Tube:initialize(x, y, width, height, spaceHeight)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.spaceHeight = spaceHeight
end

function Tube:draw()
    love.graphics.setColor(.37, .82, .28)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    --love.graphics.rectangle('fill', self.x, self.y + self.spaceHeight, self.width, self.y)
end

return Tube