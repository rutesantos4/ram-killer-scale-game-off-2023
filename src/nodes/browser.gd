extends "res://src/nodes/enemy.gd"

class_name BrowserScene

@export var browser_attack: PackedScene
@onready var attack_point: Marker2D = $AttackPoint

const THRESHOLD = 60
const TIME_PERIOD_TO_SPAWN_SECONDS = 20

var time_passed
var can_shoot = true

signal spawn_tab(tabs : Array[Tab])

func _ready():
	super._ready();
	enemy = SceneSwitcher.get_game_state().enemy
	
	$EnemySprite2D.texture = enemy.skin.texture
	
	position = enemy.position
	
	var enemy_size : Vector2 = $EnemySprite2D.texture.get_size()
	var new_shape = CircleShape2D.new()
	new_shape.radius = max(enemy_size.x, enemy_size.y) / 4
	$Area2D/CollisionShape2D.shape = new_shape
	
	time_passed = 0

func _physics_process(delta):
	super._physics_process(delta)
	time_passed += delta
	
func move_to_player():
	super.move_to_player()
	shoot_player()
	
func eat_cookie(cookie: Cookie):
	super.eat_cookie(cookie)
	
	if(time_passed > TIME_PERIOD_TO_SPAWN_SECONDS && ram.has_surpassed_threshold()):
		spawn_tab.emit(enemy.spawn())
		time_passed = 0
		AudioScene.play_sfx(GameAssetsFactory.SpawnSFX)

func shoot_player():
	if(can_shoot == false):
		return
		
	can_shoot = false
	var browser: Browser = enemy as Browser
	browser.position = position
	var target_position = player_position()
	var eletrical_shock: ElectricalShock = browser.fire(target_position)
	
	attack_point.look_at(target_position)
	attack_point.position = get_current_position()            
	
	var attack: BrowserAttackScene = browser_attack.instantiate()
	attack.transform = attack_point.global_transform
	attack.set_texture_and_collision(eletrical_shock.skin.texture)
	attack.set_attack(eletrical_shock)
	
	AudioScene.play_sfx(GameAssetsFactory.ElectricalShockSFX)

	owner.add_child(attack)
	get_tree().create_timer(0.5).connect("timeout", self.reset_can_shoot)

func reset_can_shoot():
	can_shoot = true
