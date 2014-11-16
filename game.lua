game = {}

function game:Quadlist(tileset)
	local i = 0
	local j = 0
	local Quadlist = {}

	Quadlist[0] = love.graphics.newImage(tileset.image)
	while j < tileset.imageheight do
		i = 0
		while i < tileset.imagewidth do
			table.insert(Quadlist,
				love.graphics.newQuad(i, j, 64, 64,
					tileset.imagewidth, tileset.imageheight))
			i = i + 64
		end
		j = j + 64
	end

	return Quadlist
end


function game:move(x, y)
	for k,v in pairs(self.rectangles) do
		v:move(x, y)
	end
end

function game:keypressed(key, unicode)
	if loveframes.GetState() ~= 'game' then
		return
	end

	if key == 'up' then
		self.offy = self.offy - 64
		self:move(0, -64)
	elseif key == 'down' then
		self.offy = self.offy + 64
		self:move(0, 64)
	elseif key == 'left' then
		self.offx = self.offx - 64
		self:move(-64, 0)
	elseif key == 'right' then
		self.offx = self.offx + 64
		self:move(64, 0)
	end
end

function game:populate()
	local tilesize = self.map.tilesets[1].tilewidth
	local tilenbr = self.map.layers[1].width

	print(tilenbr)

	local i = 0

	self.rectangles = {}

	while i < tilenbr do
		local j = 0
		while j < tilenbr do
			table.insert(self.rectangles, self.HC:addRectangle(j * 64 + 64, i * 64, tilesize, tilesize))
			j = j + 1
		end
		i = i + 1
	end
end

function game.collide(dt, shape_one, shape_two, dx, dy)
	if shape_one == game.mouse then
		game.toDraw = shape_two
	elseif shape_two == game.mouse then
		game.toDraw = shape_one
	end
end

function game.spriteup(sprite_img, pixel_row)
	local sprite_file = love.graphics.newImage(sprite_img)
	local sprite_width = 64
	local sprite_height = 64
	local sprite_nbr = 2

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


function game:init()
	self.HC = Collider.new(64)
	self.HC:setCallbacks(self.collide)

	self.map = require 'map'
	self.pacman = game.spriteup('Images/sprite.png', 0)
	self.Quadlist = self:Quadlist(self.map.tilesets[1])
	self:populate()

	self.offx = 64
	self.offy = 0

	self.mouse = self.HC:addCircle(0,0, 2)
	return self
end

function game:update(dt)
	self.mouse:moveTo(love.mouse.getPosition())
end

function game:draw()
	if loveframes.GetState() ~= 'game' then
		return
	end

	local i
	local j
	local k

	local m = 0
	local n = 0

	k = 1
	j = 0
	while j < self.map.layers[1].height do
		i = 1
		m = 0
		while i <= self.map.layers[1].width do
			love.graphics.draw(self.Quadlist[0], self.Quadlist[ self.map.layers[1].data[k] ], m + self.offx, n + self.offy)
			m = m + 64
			i = i + 1
			k = k + 1
		end
		n = n + 64
		j = j + 1
	end

	self.mouse:draw('line')
	self.toDraw:draw('line')
end

return game
