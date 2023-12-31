extends TextureButton

var game_node: Node
var pause_menu: Control
var pausable_group: Node
var game: Game

func _ready():
	game_node = get_tree().current_scene
	
	pausable_group = game_node.get_node("Pausable")
	pause_menu = game_node.get_node("Stickable/PauseMenu")
	game = SceneSwitcher.get_game_state()
	
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		_on_game_paused()

func _on_game_paused():
	if(game.is_paused()):
		game.resume()
	else:
		AudioScene.play_sfx(GameAssetsFactory.PauseSFX)
		game.pause()

	game_node.game_status_updated.emit() 

func _on_game_status_updated():
	if(game.is_paused()):
		self.texture_normal = GameAssetsFactory.Play.s()
		pause_menu.visible = true
		pausable_group.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		self.texture_normal = GameAssetsFactory.Pause.s()
		pause_menu.visible = false
		pausable_group.process_mode = Node.PROCESS_MODE_INHERIT
		
	if(game.is_finished()): self.visible = false
