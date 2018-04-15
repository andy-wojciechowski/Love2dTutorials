function love.load()
    cursor = love.graphics.newImage("crosshair.png")
    love.mouse.setVisible(false)
    love.mouse.setGrabbed(true)
end

function love.draw()
    love.graphics.draw(cursor, love.mouse.getX() - cursor:getWidth() / 2, love.mouse.getY() - cursor:getHeight() / 2)
end