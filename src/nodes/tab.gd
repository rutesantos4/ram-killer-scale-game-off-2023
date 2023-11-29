extends "res://src/nodes/enemy.gd"

class_name TabScene

func _ready():
	super._ready()
	
	$EnemySprite2D.texture = enemy.skin.texture
	
	var enemy_size : Vector2 = $EnemySprite2D.texture.get_size()
	var new_shape = CircleShape2D.new()
	new_shape.radius = max(enemy_size.x, enemy_size.y) / 4
	$Area2D/CollisionShape2D.shape = new_shape
	position = enemy.position
	
func set_texture(texture: Texture2D):
	$EnemySprite2D.texture = texture

func got_attacked():
	queue_free()
