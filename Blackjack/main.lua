local buttonWidth = 70
local buttonHeight = 25
local hitX = 50
local standX = 150
local buttonY = 250
local deck = {}
local playerDeck = {}
local dealerDeck = {}
local images = {}
local isPlayerHandComplete = false

function love.load()
    love.window.setTitle("Blackjack")
    for _, e in ipairs({'club', 'diamond', 'heart', 'spade'}) do 
        for i = 1, 13 do 
            table.insert(deck, {suit = e, rank = i})
        end
    end
    table.insert(playerDeck, table.remove(deck, love.math.random(#deck)))
    table.insert(dealerDeck, table.remove(deck, love.math.random(#deck)))

    for nameIndex, name in ipairs({
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
        'pip_heart', 'pip_diamond', 'pip_club', 'pip_spade',
        'mini_heart', 'mini_diamond', 'mini_club', 'mini_spade',
        'card', 'card_face_down',
        'face_jack', 'face_queen', 'face_king',
    }) do
        images[name] = love.graphics.newImage('images/'..name..'.png')
    end
end

function love.update(dt)
    if isPlayerHandComplete then
        local dealerTotal = 0
        repeat 
            local currentTotal = 0
            table.insert(dealerDeck, table.remove(deck, love.math.random(#deck)))
            for _, e in ipairs(dealerDeck) do 
                local valueToAdd = e.rank
                if (e.rank == 11 or e.rank == 12 or e.rank == 13) then
                    if currentTotal + 10 < 17 then
                        valueToAdd = 10
                    else
                        valueToAdd = 1
                    end
                end
                if (e.rank == 1) then
                    if currentTotal + 11 < 17 then
                        valueToAdd = 11
                    else
                        valueToAdd = 1
                    end
                end
                currentTotal = currentTotal + valueToAdd
            end
        until dealerTotal > 17
        reset()
    end
end

function love.draw()
    local hitOffsetX = 20
    local standOffsetX = 15
    love.graphics.setColor(1, 0.65, 0)
    love.graphics.rectangle('fill', hitX, buttonY, buttonWidth, buttonHeight)
    love.graphics.rectangle('fill', standX, buttonY, buttonWidth, buttonHeight)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print('Hit!', hitX + hitOffsetX, buttonY)
    love.graphics.print('Stand', standX + standOffsetX, buttonY)
end

function love.mousereleased(x, y, button)
    if not isPlayerHandComplete then
        if x > hitX and x < hitX + buttonWidth and y > buttonY and y < buttonY + buttonHeight then
            hit()
        elseif x > standX and x < standX + buttonWidth and y > buttonY and y < buttonY + buttonHeight then
            stand()
        end
    end
end

function hit()
    table.insert(playerDeck, table.remove(deck, love.math.random(#deck)))
    local currentTotal = 0
    for _, e in ipairs(playerDeck) do 
        local valueToAdd = e.rank
        if (e.rank == 11 or e.rank == 12 or e.rank == 13) then
            if currentTotal + 10 < 21 then
                valueToAdd = 10
            else
                valueToAdd = 1
            end
        end
        if (e.rank == 1) then
            if currentTotal + 11 < 21 then
                valueToAdd = 11
            else
                valueToAdd = 1
            end
        end
        currentTotal = currentTotal + valueToAdd
    end

    if currentTotal > 21 then isPlayerHandComplete = true end
end

function stand()
    isPlayerHandComplete = true
end

function reset()
    for i, e in ipairs(deck) do deck[i] = nil end
    for i, e in ipairs(playerDeck) do playerDeck[i] = nil end
    for i, e in ipairs(dealerDeck) do dealerDeck[i] = nil end

    for _, e in ipairs({'club', 'diamond', 'heart', 'spade'}) do 
        for i = 1, 13 do 
            table.insert(deck, {suit = e, rank = i})
        end
    end
    table.insert(playerDeck, table.remove(deck, love.math.random(#deck)))
    table.insert(dealerDeck, table.remove(deck, love.math.random(#deck)))
end