return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 16,
  height = 16,
  tilewidth = 64,
  tileheight = 64,
  properties = {},
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "Images/tileset.png",
      imagewidth = 512,
      imageheight = 512,
      properties = {},
      tiles = {
        {
          id = 0,
          properties = {
            ["wall"] = "0"
          }
        },
        {
          id = 1,
          properties = {
            ["wall"] = "1"
          }
        },
        {
          id = 2,
          properties = {
            ["wall"] = "1"
          }
        },
        {
          id = 3,
          properties = {
            ["wall"] = "1"
          }
        },
        {
          id = 4,
          properties = {
            ["wall"] = "1"
          }
        },
        {
          id = 9,
          properties = {
            ["wall"] = "1"
          }
        },
        {
          id = 10,
          properties = {
            ["wall"] = "1"
          }
        },
        {
          id = 11,
          properties = {
            ["wall"] = "1"
          }
        },
        {
          id = 12,
          properties = {
            ["wall"] = "1"
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Calque de Tile 1",
      x = 0,
      y = 0,
      width = 16,
      height = 16,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1,
        5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 10, 3, 3, 3, 11, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 12, 4, 4, 4, 13, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1
      }
    }
  }
}
