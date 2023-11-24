extends "res://src/nodes/enemy.gd"

const THRESHOLD = 60
const TIME_PERIOD_TO_SPAWN_SECONDS = 20

var time_passed
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
	
	time_passed = 0


func _physics_process(delta):
	super._physics_process(delta)
	time_passed += delta
	
func eat_cookie(cookie: Cookie):
	super.eat_cookie(cookie)
	
	if(time_passed > TIME_PERIOD_TO_SPAWN_SECONDS && ram.has_surpassed_threshold()):
		spawn_tab.emit(enemy.spawn())
		time_passed = 0
