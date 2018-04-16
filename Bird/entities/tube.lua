tube = {}

function Tube:new(x, y, width, spaceHeight)
    local o
    o.x = x
    o.y = y
    o.width = width
    o.spaceHeight = spaceHeight
end

function Tube:draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.y)
    love.graphics.rectangle('fill', self.x, self.y + self.spaceHeight, self.width, self.y)
end