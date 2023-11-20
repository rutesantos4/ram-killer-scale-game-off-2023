extends "res://src/nodes/enemy.gd"


func _ready():
	super._ready()
	
	var _position = enemy.position
	$EnemySprite2D.texture = enemy.skin.texture
	$EnemySprite2D.position = _position
	
	var enemy_size : Vector2 = $EnemySprite2D.texture.get_size()
	var new_shape = CircleShape2D.new()
	new_shape.radius = max(enemy_size.x, enemy_size.y) / 4
	$Area2D/CollisionShape2D.shape = new_shape
	
	$Area2D/CollisionShape2D.position = _position
	$CollisionShape2D.position = _position
	
func set_texture(texture: Texture2D):
	$EnemySprite2D.texture = texture
