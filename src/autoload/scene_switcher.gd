extends Node

# Private variable
var _game_state : Game = null

# Changes scene while storing the game state
func change_scene(next_scene_file, game_state: Game = null):
	_game_state = game_state
	get_tree().change_scene_to_file(next_scene_file)

func get_game_state() -> Game:
	return _game_state
