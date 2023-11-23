extends TextureButton

var pause_menu: Control

func _ready():
	pause_menu = get_tree().current_scene.get_node("PauseMenu")
	self.connect("pressed", _on_game_paused)	

func _on_game_paused():
	get_tree().paused = true
	pause_menu.visible = !pause_menu.visible
