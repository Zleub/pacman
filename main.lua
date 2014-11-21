function love.load()
	loveframes = require "loveframes"
	Collider = require "hardoncollider"
	require 'menu'
	game = require('game'):init()
	inspect = require 'inspect'
end

function love.update(dt)
	game.HC:update(dt)
	game:update(dt)
	loveframes.update(dt)
end

function love.draw()
	game:draw()
	loveframes.draw()
end

function love.mousepressed(x, y, button)
	loveframes.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	loveframes.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
	menu_keypressed(key, unicode)
	game:keypressed(key, unicode)
	loveframes.keypressed(key, unicode)
end

function love.keyreleased(key)
	loveframes.keyreleased(key)
end

function love.textinput(text)
	loveframes.textinput(text)
end

