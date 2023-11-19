extends Camera2D

func _ready():
	var map_size = SceneSwitcher.get_game_state().map.size
	limit_right = map_size.x/2
	limit_left = -map_size.x/2
	limit_bottom = map_size.y/2
	limit_top = -map_size.y/2
