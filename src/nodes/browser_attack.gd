extends Area2D

class_name BrowserAttackScene

const SPEED: float = 25.0
const MAX_DISTANCE: float = 500.0

var game_node: GameScene
var player: Player
var ram: RAM
var eletrical_shock: ElectricalShock
var initial_position: Vector2

func _ready():
	game_node = get_tree().root.get_node("/root/Game")
	player = SceneSwitcher.get_game_state().player
	initial_position = position

func set_texture_and_collision(texture: Texture2D):
	$Sprite2D.texture = texture
	
	var size : Vector2 = texture.get_size()
	var new_shape = CircleShape2D.new()
	new_shape.radius = max(size.x, size.y) / 4
	$CollisionShape2D.shape = new_shape

func set_attack(eletrical_shock: ElectricalShock):
	self.eletrical_shock = eletrical_shock
	
func _physics_process(delta):
	var next_position = position + transform.x * SPEED
	if(abs(initial_position.distance_to(next_position)) > MAX_DISTANCE):
		delete()
	position = next_position
	eletrical_shock.position = position

func _on_body_entered(body: Node2D):
	if body is BrowserScene:
		return
	if body is PlayerScene:
		AudioScene.play_sfx(GameAssetsFactory.HealthLossSFX)
		player.receive(eletrical_shock)
		game_node.player_health_updated.emit()
	delete()

func delete():
	queue_free()
