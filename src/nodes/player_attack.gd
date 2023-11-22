extends Area2D

@export var tab: Node2D

const SPEED: float = 25.0

var player: Player
var game_node: Node

func _ready():
	game_node = get_tree().root.get_node("/root/Game")
	player = SceneSwitcher.get_game_state().player
	var texture = GameAssetsFactory.PlayerAttack.xs()
	$Sprite2D.texture = texture
	
	var enemy_size : Vector2 = texture.get_size()
	var new_shape = CircleShape2D.new()
	new_shape.radius = max(enemy_size.x, enemy_size.y) / 2
	$CollisionShape2D.shape = new_shape
	

func _physics_process(delta):
	position += transform.x * SPEED

func _on_body_entered(body: Node2D):
	if body is PlayerScene: return
	if body is TabScene:
		var tab_scene = body as TabScene
		tab_scene.got_attacked()
		player.close(tab_scene.enemy)
		game_node.player_points_updated.emit()
	queue_free()
