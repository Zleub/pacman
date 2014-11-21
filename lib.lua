function toQuadlist(tileset)
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

function collide(dt, shape_one, shape_two, dx, dy)
	if shape_one == game.mouse then
		game.toDraw = shape_two
	elseif shape_two == game.mouse then
		game.toDraw = shape_one
	end
end

function spriteup(sprite_file, pixel_row)
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

function getTile(tileset, tileid)
	for k,v in pairs(tileset.tiles) do
		if v.id == tileid then
			return v
		end
	end
	return nil
end
