extends Area2D

const SPEED: float = 25.0

func _ready():
	var texture = GameAssetsFactory.PlayerAttack.xs()
	$Sprite2D.texture = texture
	
	var enemy_size : Vector2 = texture.get_size()
	var new_shape = CircleShape2D.new()
	new_shape.radius = max(enemy_size.x, enemy_size.y) / 2
	$CollisionShape2D.shape = new_shape

func _physics_process(delta):
	position += transform.x * SPEED
	
