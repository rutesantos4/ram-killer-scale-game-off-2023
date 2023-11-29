extends Control

func _ready():
	AudioScene.switch_bgm(GameAssetsFactory.MainMenuBGM)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://src/scenes/selection_menu.tscn")


func _on_help_pressed():
	get_tree().change_scene_to_file("res://src/scenes/help_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()
