extends "res://src/nodes/enemy.gd"

var value: Tab

func _ready():
	enemy = value
	super._ready()
	
func set_texture(texture: Texture2D):
	$EnemySprite2D.texture = texture
