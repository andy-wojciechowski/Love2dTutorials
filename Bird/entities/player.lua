local class = require "libs.middleClass"

local Player = class("Player")

function Player:initialize()
    self.x = 62
    self.y = 200
    self.width = 30
    self.height = 25
    self.y_velocity = 0
    self.jump_height = -200
end

function Player:draw()
    love.graphics.setColor(.87, .84, .27)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Player:updatePosition(jump, gravity, dt)
    if jump then
        self.y_velocity = self.jump_height
    end
    
    if self.y_velocity ~= 0 then
        self.y = self.y + self.y_velocity * dt
        self.y_velocity = self.y_velocity - gravity * dt
    end
end

function Player:isCollidingWithTube(tube)
    --top porition
    if self.y < tube.y then
        --left edge
        if self.x + self.width == tube.x then
            return true
        --right edge
        elseif self.x == tube.x + tube.width then
            return true
        end
    --bottom portion
    else
        --left edge
        if self.x + self.width == tube.x then
            return true
        elseif self.x == tube.x + tube.width then
            return true
        end
    end
    return false
end

return Player