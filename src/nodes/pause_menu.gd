extends Control

var game: Game
var game_node: Node

func _ready():
	game = SceneSwitcher.get_game_state()
	game_node = get_tree().current_scene
	set_mute_button_text()

func resume():
	game.resume()
	game_node.game_status_updated.emit()

func mute():
	if(AudioScene.is_muted()):
		AudioScene.unmute()
	else:
		AudioScene.mute()
	
	set_mute_button_text()

func set_mute_button_text():
	if(not AudioScene.is_muted()):
		$Options/Column/Mute.text = "Mute"
	else:
		$Options/Column/Mute.text = "Unmute"
	
func quit():
	game.end()
	AudioScene.unmute()
	game_node.game_status_updated.emit()
	SceneSwitcher.change_scene("res://src/scenes/main_menu.tscn")
