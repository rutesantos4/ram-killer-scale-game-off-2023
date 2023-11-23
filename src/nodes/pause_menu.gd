extends Control

var resume_button_node: Button
var mute_button_node: Button
var quit_button_node: Button

var game: Game
var game_node: Node

func _ready():
	game = SceneSwitcher.get_game_state()
	game_node = get_tree().current_scene
	
	resume_button_node = $MarginContainer/VBoxContainer/Resume
	mute_button_node = $MarginContainer/VBoxContainer/Mute
	quit_button_node = $MarginContainer/VBoxContainer/Quit
	
	resume_button_node.connect("pressed", resume)
	mute_button_node.connect("pressed", mute)
	quit_button_node.connect("pressed", quit)

func resume():
	game.resume()
	game_node.game_status_updated.emit()

func mute():
	pass
	
func quit():
	game.end()
	game_node.game_status_updated.emit()
	SceneSwitcher.change_scene("res://src/scenes/main_menu.tscn")
