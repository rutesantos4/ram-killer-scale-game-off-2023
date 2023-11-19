extends Object
class_name GameInfo

# Member variables.
var _player_image : Texture2D
var _enemy_image : Texture2D
var _map_image : Texture2D

# Constructor
func _init(player, enemy, map):
	_player_image = player;
	_enemy_image = enemy;
	_map_image = map;

func get_player_image():
	return _player_image

func get_enemy_image():
	return _enemy_image

func get_map_image():
	return _map_image

