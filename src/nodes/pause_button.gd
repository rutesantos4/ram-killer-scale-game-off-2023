extends TextureButton

var game_node: Node
var pause_menu: Control
var pausable_group: SceneTree
var game: Game

func _ready():
	game_node = get_tree().current_scene
	
	pausable_group = game_node.get_node("Pausable")
	pause_menu = game_node.get_node("Stickable/PauseMenu")
	game = SceneSwitcher.get_game_state()
	
	self.connect("pressed", _on_game_paused)
	
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		_on_game_paused()

func _on_game_paused():
	if(game.is_paused()):
		game.resume()
	else:
		game.pause()

	game_node.game_status_updated.emit() 

func _on_game_status_updated():
	pause_menu.visible = is_game_paused
	
	if(game.is_paused()):
		self.texture_normal = GameAssetsFactory.Play.s()
		pausable_group.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		self.texture_normal = GameAssetsFactory.Pause.s()
		pausable_group.process_mode = Node.PROCESS_MODE_INHERIT
