extends Area2D

@export var tab: Node2D

const SPEED: float = 25.0
const MAX_DISTANCE: float = 500.0

var game_node: Node
var player: Player
var ram: RAM
var initial_position: Vector2

func _ready():
	game_node = get_tree().root.get_node("/root/Game")
	player = SceneSwitcher.get_game_state().player
	ram = SceneSwitcher.get_game_state().ram
	initial_position = position
	
	var texture = GameAssetsFactory.PlayerAttack.xs()
	$Sprite2D.texture = texture
	
	var enemy_size : Vector2 = texture.get_size()
	var new_shape = CircleShape2D.new()
	new_shape.radius = max(enemy_size.x, enemy_size.y) / 2
	$CollisionShape2D.shape = new_shape
	

func _physics_process(delta):
	var next_position = position + transform.x * SPEED
	if(abs(initial_position.distance_to(next_position)) > MAX_DISTANCE):
		delete()
	position = next_position

func _on_body_entered(body: Node2D):
	if body is PlayerScene: return
	if body is TabScene:
		var tab_scene = body as TabScene
		tab_scene.got_attacked()
		var tab: Tab = tab_scene.enemy
		player.close(tab)
		game_node.player_points_updated.emit()
		ram.decrease_from_tab_close(tab)
	delete()

func delete():
	queue_free()
