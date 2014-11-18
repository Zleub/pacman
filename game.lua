game = {}

require 'lib'

function game:dump_offset(diffx, diffy)
	print('-  -  -  -  -')
	print('offset x:', self.offx, '->', self.offx + diffx)
	print('offset y:', self.offy, '->', self.offy + diffy)
end

function game:dump_pacman()
	print('+  =  +  =  +  =  +')
	print(inspect(self.pacman))

end

-- self.HC
-- self.map
function game:populate()
	local tilesize = self.map.tiled.tilesets[1].tilewidth
	local tilenbr = self.map.tiled.layers[1].width

	local i = 0
	local k = 1

	self.rectangles = {}

	while i < tilenbr do
		local j = 0
		while j < tilenbr do
			if game.getTile(self.map.tiled.tilesets[1], self.map.tiled.layers[1].data[k] - 1).properties.wall == '1' then
				table.insert(self.rectangles, self.HC:addRectangle(j * 64 + self.offx, i * 64+ self.offy, tilesize, tilesize))
			end
			j = j + 1
			k = k + 1
		end
		i = i + 1
	end
end

function game.getTile(tileset, tileid)
	for k,v in pairs(tileset.tiles) do
		if v.id == tileid then
			return v
		end
	end
	return nil
end

-- self.rectangles
function game:move(x, y)
	for k,v in pairs(self.rectangles) do
		v:move(x, y)
	end
end

function game:init()
	-- DEBUG
	inspect = require('inspect')

	-- COLLISION
	self.HC = Collider.new(64)
	self.HC:setCallbacks(collide)

	-- MAP
	self.map = require 'map':init()

	-- SPRITE
	self.sprite_file = love.graphics.newImage('Images/sprite.png')
	self.pacman = require 'pacman':init()

	self.pacman.shape = self.HC:addCircle(self.pacman.x + 32, self.pacman.y + 32, 31)


	self.offx = 128
	self.offy = 0

	self:populate()
	self.mouse = self.HC:addCircle(0,0, 2)
	return self
end

function game:update(dt)
	self.mouse:moveTo(love.mouse.getPosition())
end

function game:canmove(x, y)
	self.pacman.shape:move(x, y)
	self.pacman.x = self.pacman.x + x
	self.pacman.y = self.pacman.y + y
	for k,v in pairs(self.rectangles) do
		if (v:collidesWith(self.pacman.shape)) then
			self.pacman.shape:move(-x, -y)
			self.pacman.x = self.pacman.x - x
			self.pacman.y = self.pacman.y - y
		end
	end

end

function game:keypressed(key, unicode)
	if loveframes.GetState() ~= 'game' then
		return
	end

	if key == 'up' then
		self:canmove(0, -64)
	elseif key == 'down' then
		self:canmove(0, 64)
	elseif key == 'left' then
		self:canmove(-64, 0)
	elseif key == 'right' then
		self:canmove(64, 0)
	end

	print(self.pacman.x, self.pacman.y)
end

function game:draw()
	if loveframes.GetState() ~= 'game' then
		return
	end

	self.map:draw(self.offx, self.offy)
	self.pacman:draw()
	-- self.pacman.shape:draw('fill')
	self.mouse:draw('line')
	self.toDraw:draw('line')
end

return game
