game = {}

require 'lib'

function game:init()
	-- DEBUG
	inspect = require('inspect')

	-- COLLISION
	self.HC = Collider.new(64)
	self.HC:setCallbacks(collide)

	-- MAP
	self.map = require 'map':init(self.HC)

	-- SPRITE
	self.sprite_file = love.graphics.newImage('Images/sprite.png')
	self.pacman = require 'pacman':init(self.HC)

	self.window = {}
	self.window.width = love.window.getWidth()
	self.window.height = love.window.getHeight()

	return self
end

function game:update(dt)
end

function game:keytrans(key, unicode)
	if key == 'up' then
		return 0, -64
	elseif key == 'down' then
		return 0, 64
	elseif key == 'left' then
		return -64, 0
	elseif key == 'right' then
		return 64, 0
	else
		return 0, 0
	end
end

function game:canmovepacman(x, y)
	self.pacman.shape:move(x, y)
	for k,v in pairs(self.map.walls) do
		if (v:collidesWith(self.pacman.shape)) then
			self.pacman.shape:move(-x, -y)
			return
		end
	end

	if y == 0 and self.map.width > self.window.width then
		self.map:SetOffset(-x, -y)
		self.pacman.shape:move(-x, -y)
		return
	elseif x == 0 and self.map.height > self.window.height then
		self.map:SetOffset(-x, -y)
		self.pacman.shape:move(-x, -y)
		return
	else
		self.pacman:move(x, y)
	end
end

function game:keypressed(key, unicode)
	if loveframes.GetState() ~= 'game' then
		return
	end

	if key == 'escape' then
		love.event.quit()
	end

	self:canmovepacman(self:keytrans(key))
	self.pacman:keypressed(key, unicode)
end

function game:draw()
	if loveframes.GetState() ~= 'game' then
		return
	end

	self.map:draw()
	self.pacman:draw()
end

return game
