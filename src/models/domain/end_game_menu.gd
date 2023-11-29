extends Control

var game_node: Node
var pausable_group: Node
var game: Game

func _ready():
	game_node = get_tree().current_scene
	
	pausable_group = game_node.get_node("Pausable")
	game = SceneSwitcher.get_game_state()

func _on_main_menu_pressed():
	AudioScene.unmute()
	game_node.game_status_updated.emit()
	SceneSwitcher.change_scene("res://src/scenes/main_menu.tscn")

func _on_restart_pressed():
	AudioScene.unmute()
	game_node.game_status_updated.emit()
	SceneSwitcher.change_scene("res://src/scenes/selection_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_game_player_health_updated():
	if(game.player.is_dead()): end_game()

func _on_game_ram_updated():
	if(game.ram.has_reached_max_capacity()): end_game()

func end_game():
	game.end()
	game_node.game_status_updated.emit()
	self.visible = true
	pausable_group.process_mode = Node.PROCESS_MODE_DISABLED
