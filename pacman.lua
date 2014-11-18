pacman = {}

require 'lib'

function pacman:init()
	self.sprite_file = love.graphics.newImage('Images/sprite.png')
	self.sprites = spriteup(self.sprite_file, 0)
	self.x = 64 * 10
	self.y = 64 * 5
	return self
end

function pacman:keypressed(key, unicode, rectangles)
	if key == 'up' then
		self.shape:move(0, -64)
		self.y = self.y - 64
		for k,v in pairs(rectangles) do
			if (v:collidesWith(self.shape)) then
				self.shape:move(0, 64)
				self.y = self.y + 64
			end
		end
	elseif key == 'down' then
		self.shape:move(0, 64)
		self.y = self.y + 64
		for k,v in pairs(rectangles) do
			if (v:collidesWith(self.shape)) then
				self.shape:move(0, -64)
				self.y = self.y - 64
			end
		end
	elseif key == 'left' then
		self.shape:move(-64, 0)
		self.x = self.x - 64
		for k,v in pairs(rectangles) do
			if (v:collidesWith(self.shape)) then
				self.shape:move(64, 0)
				self.x = self.x + 64
			end
		end
	elseif key == 'right' then
		self.shape:move(64, 0)
		self.x = self.x + 64
		for k,v in pairs(rectangles) do
			if (v:collidesWith(self.shape)) then
				self.shape:move(-64, 0)
				self.x = self.x - 64
			end
		end
	end
end

function pacman:draw()
	love.graphics.draw(self.sprite_file, self.sprites[1], self.x, self.y)
end

return pacman
