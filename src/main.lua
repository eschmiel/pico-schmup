--life cycle
function _init()
	game_state = mk_title_state()
end

function _update()
	game_state:update()
end

function _draw()
	cls()
	game_state:draw()
end