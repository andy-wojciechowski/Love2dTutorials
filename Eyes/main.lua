function love.load()
    love.window.setTitle("Eyes")
end

function love.draw()
    drawEye(200, 200)
    drawEye(400, 200)
end

function drawEye(x, y)
    local eyeMaxDistance = 30
    local distanceX = love.mouse.getX() - x
    local distanceY = love.mouse.getY() - y
    local distance = math.sqrt(distanceX^2 - distanceY^2)
    local angle = math.atan2(distanceX, distanceY)

    if(distance > eyeMaxDistance) then 
        distance = eyeMaxDistance
    end

    local pupilX = x + (math.cos(angle) * distance)
    local pupilY = y + (math.sin(angle) * distance)

    love.graphics.setColor(1, 1, 1)
    love.graphics.circle('fill', x, y, 50)

    love.graphics.setColor(0, 0, .4)
    love.graphics.circle('fill', pupilX, pupilY, 15)
end