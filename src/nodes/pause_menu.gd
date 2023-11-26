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
	if(AudioScene.is_muted()):
		AudioScene.unmute()
		$MarginContainer/VBoxContainer/Mute.text = "Mute"
	else:
		AudioScene.mute()
		$MarginContainer/VBoxContainer/Mute.text = "Unmuted"
	
func quit():
	game.end()
	AudioScene.unmute()
	game_node.game_status_updated.emit()
	SceneSwitcher.change_scene("res://src/scenes/main_menu.tscn")
