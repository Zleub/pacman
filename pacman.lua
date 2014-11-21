pacman = {}

require 'lib'

function pacman.spriteup(sprite_file, pixel_row)
	local sprite_width = 64
	local sprite_height = 64
	local sprite_nbr = 8

	local Quadlist = {}
	local i = 0

	while i ~= sprite_nbr do
		table.insert(
			Quadlist,
			love.graphics.newQuad(
				0 + i * sprite_width,
				pixel_row,
				sprite_width,
				sprite_height,
				sprite_file:getDimensions()
			)
		)
		i = i + 1
	end
	return Quadlist
end

function pacman:init(HC)
	self.HC = HC
	self.sprite_file = love.graphics.newImage('Images/sprite.png')
	self.sprites = self.spriteup(self.sprite_file, 0)
	self.sprites.index = 1
	self.x = 64 * 10
	self.y = 64 * 5
	self.shape = self.HC:addCircle(self.x + 32, self.y + 32, 31)
	return self
end

function pacman:move(x, y)
	self.x = self.x + x
	self.y = self.y + y
end

function pacman:keypressed(key, unicode)
	if key == 'up' then
		self.sprites.index = 7
	elseif key == 'down' then
		self.sprites.index = 5
	elseif key == 'left' then
		self.sprites.index = 3
	elseif key == 'right' then
		self.sprites.index = 1
	end
end

function pacman:draw()
	love.graphics.draw(self.sprite_file, self.sprites[self.sprites.index], self.x, self.y)
end

return pacman
