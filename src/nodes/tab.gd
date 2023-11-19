extends "res://src/nodes/enemy.gd"

var value: Tab

func _ready():
	super._ready()
	
func set_texture(texture: Texture2D):
	$EnemySprite2D.texture = texture
