function menu_keypressed(key, unicode)
	if key == 'return' then
		ft_new()
	end
end

function ft_new()
	loveframes.SetState('game')
end

loveframes = require 'loveframes'

bt_new = loveframes.Create('button'):SetText('New Game')
bt_new.OnClick = ft_new
bt_new:Center()
