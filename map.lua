map = {}

require 'lib'

function map:init()
	self.tiled = require 'mapdemerde'
	self.Quadlist = toQuadlist(self.tiled.tilesets[1])
	return self
end

function map:draw(offx, offy)
	local i = 1
	local j = 0
	local k = 1

	local m = 0
	local n = 0

	while j < self.tiled.layers[1].height do
		i = 1
		m = 0
		while i <= self.tiled.layers[1].width do
			love.graphics.draw(self.Quadlist[0], self.Quadlist[ self.tiled.layers[1].data[k] ], m + offx, n + offy)
			m = m + 64
			i = i + 1
			k = k + 1
		end
		n = n + 64
		j = j + 1
	end
end

return map
