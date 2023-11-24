extends "res://src/nodes/enemy.gd"

const THRESHOLD = 60

signal spawn_tab(tabs : Array[Tab])

func _ready():
	super._ready();
	enemy = SceneSwitcher.get_game_state().enemy
	
	var _position = enemy.position
	$EnemySprite2D.texture = enemy.skin.texture
	$EnemySprite2D.position = _position
	
	var enemy_size : Vector2 = $EnemySprite2D.texture.get_size()
	var new_shape = CircleShape2D.new()
	new_shape.radius = max(enemy_size.x, enemy_size.y) / 4
	$Area2D/CollisionShape2D.shape = new_shape
	
	$Area2D/CollisionShape2D.position = _position
	$CollisionShape2D.position = _position

func eat_cookie(cookie: Cookie):
	super.eat_cookie(cookie)
	#TODO: if (time passed until next spawn && ram usage > threshold):
	if(ram.has_surpassed_threshold()):
		spawn_tab.emit(enemy.spawn())
