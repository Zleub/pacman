-- function love.load()
-- 	loveframes = require "loveframes"
-- 	Collider = require "hardoncollider"
-- 	require 'menu'
-- 	game = require('game'):init()
-- 	inspect = require 'inspect'
-- end

-- function love.update(dt)
-- 	game.HC:update(dt)
-- 	game:update(dt)
-- 	loveframes.update(dt)
-- end

-- function love.draw()
-- 	game:draw()
-- 	loveframes.draw()
-- end

-- function love.mousepressed(x, y, button)
-- 	loveframes.mousepressed(x, y, button)
-- end

-- function love.mousereleased(x, y, button)
-- 	loveframes.mousereleased(x, y, button)
-- end

-- function love.keypressed(key, unicode)
-- 	game:keypressed(key, unicode)
-- 	loveframes.keypressed(key, unicode)
-- end

-- function love.keyreleased(key)
-- 	loveframes.keyreleased(key)
-- end

-- function love.textinput(text)
-- 	loveframes.textinput(text)
-- end

-- --[[


-- --]]

function love.load()
    local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]

    position = {x = 400, y = 300}
    speed = 300
end

function love.update(dt)
    if not joystick then return end

    if joystick:isGamepadDown("dpleft") then
        position.x = position.x - speed * dt
    elseif joystick:isGamepadDown("dpright") then
        position.x = position.x + speed * dt
    end

    if joystick:isGamepadDown("dpup") then
        position.y = position.y - speed * dt
    elseif joystick:isGamepadDown("dpdown") then
        position.y = position.y + speed * dt
    end
end

function love.draw()
    love.graphics.circle("fill", position.x, position.y, 50)
end
