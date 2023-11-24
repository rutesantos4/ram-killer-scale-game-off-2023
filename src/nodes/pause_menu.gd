extends Control

var game: Game
var game_node: Node

func _ready():
	game = SceneSwitcher.get_game_state()
	game_node = get_tree().current_scene

func resume():
	game.resume()
	game_node.game_status_updated.emit()

func mute():
	pass
	
func quit():
	game.end()
	game_node.game_status_updated.emit()
	SceneSwitcher.change_scene("res://src/scenes/main_menu.tscn")
