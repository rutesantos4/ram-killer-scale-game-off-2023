extends Object
class_name GameInfo

# Member variables.
var _player_image : Texture2D
var _operation_system_image : Texture2D
var _map_image : Texture2D

# Constructor
func _init(player_image, operation_system_image, map_image):
	_player_image = player_image;
	_operation_system_image = operation_system_image;
	_map_image = map_image;

func get_player_image():
	return _player_image
