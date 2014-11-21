map = {}

require 'lib'

function map:populate_walls()
	local tilesize = self.tiled.tilesets[1].tilewidth
	local tilenbr = self.tiled.layers[1].width

	local i = 0
	local k = 1

	self.walls = {}

	while i < tilenbr do
		local j = 0
		while j < tilenbr do
			if getTile(self.tiled.tilesets[1], self.tiled.layers[1].data[k] - 1).properties.wall == '1' then
				table.insert(self.walls, self.HC:addRectangle(j * 64 + self.offset_x, i * 64+ self.offset_y, tilesize, tilesize))
			end
			j = j + 1
			k = k + 1
		end
		i = i + 1
	end
end

function map:move_walls(x, y)
	for k,v in pairs(self.walls) do
		v:move(x, y)
	end
end

function map:init(HC)
	self.HC = HC
	self.offset_x = 0
	self.offset_y = 0

	self.tiled = require 'tiledmap3'
	self.width = self.tiled.tilewidth * self.tiled.width
	self.height = self.tiled.tileheight * self.tiled.height
	self.Quadlist = toQuadlist(self.tiled.tilesets[1])

	self:populate_walls()
	return self
end

function map:SetOffset(offset_x, offset_y)
	self:move_walls(offset_x, offset_y)
	self.offset_x = self.offset_x + offset_x
	self.offset_y = self.offset_y + offset_y
end

function map:draw()
	local i = 1
	local j = 0
	local k = 1

	local m = 0
	local n = 0

	while j < self.tiled.layers[1].height do
		i = 1
		m = 0
		while i <= self.tiled.layers[1].width do
			love.graphics.draw(
				self.Quadlist[0],
				self.Quadlist[ self.tiled.layers[1].data[k] ],
				m + self.offset_x, n + self.offset_y)
			m = m + 64
			i = i + 1
			k = k + 1
		end
		n = n + 64
		j = j + 1
	end
end

function map:draw_walls()
	for k,v in pairs(self.walls) do
		v:draw()
	end
end

return map
