Player = {}

function Player:new()
    local o = {}
    o.x = 62
    o.y = 200
    o.width = 30
    o.height = 25
    o.y_velocity = 0
    o.jump_height = -200
    return o
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
        self.y = player.y + self.y_velocity * dt
        self.y_velocity = self.y_velocity - gravity * dt
    end
end