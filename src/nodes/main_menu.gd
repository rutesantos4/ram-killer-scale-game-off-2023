extends Control

func _ready():
	AudioScene.switch_bgm(GameAssetsFactory.MainMenuBGM)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://src/scenes/selection_menu.tscn")


func _on_help_pressed():
	get_tree().change_scene_to_file("res://src/scenes/help_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_mute_button_pressed():
	if(AudioScene.is_muted()):
		AudioScene.unmute()
		$MuteButton.icon = GameAssetsFactory.Mute.s()
	else:
		AudioScene.mute()
		$MuteButton.icon = GameAssetsFactory.Unmute.s()
		


func _on_help_button_pressed():
	get_tree().change_scene_to_file("res://src/scenes/help_menu.tscn")


func _on_info_button_pressed():
	OS.shell_open("https://github.com/rutesantos4/ram-killer-scale-game-off-2023")
