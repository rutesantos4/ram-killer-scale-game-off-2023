extends Node

# Private variable
var _game_info : GameInfo = null

# Changes scene while storing the game info
func change_scene(next_scene_file, game_info : GameInfo = null):
	_game_info = game_info
	get_tree().change_scene_to_file(next_scene_file)

func get_game_info():
	return _game_info
