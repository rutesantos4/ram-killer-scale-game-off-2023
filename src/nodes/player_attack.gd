extends Area2D

@export var tab: Node2D

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

func _on_body_entered(body: Node2D):
	print(body.name)
	# TODO: fix this - not all tabs are marked as 'Tab' (some are CharacterBody2D)
	if(body.name == 'Tab'):
		print("Here")
		body.got_attacked()
