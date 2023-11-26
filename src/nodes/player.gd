extends CharacterBody2D

class_name PlayerScene

@export var player_attack: PackedScene
@onready var attack_point: Marker2D = $AttackPoint

const MAX_SPEED = 250.0
const MIN_SPEED = 50.0
const DASH_SPEED_MULTIPLIER = 4.5
const SEC_UNTIL_ENERGY_RENEWAL = 2.0
const PLAYER_ATTACK_SPEED = 1000.0

var game: Game
var player: Player
var game_node: GameScene
var ram: RAM

func _ready():
	game = SceneSwitcher.get_game_state()
	player = game.player
	game_node = get_tree().root.get_node("/root/Game")
	ram = SceneSwitcher.get_game_state().ram
	# Set the player image
	$PlayerSprite2D.texture = player.skin.texture
	# Set the player position
	$PlayerSprite2D.position = player.position
	# Set the player collision radius
	var player_size : Vector2 = $PlayerSprite2D.texture.get_size()
	var new_shape = CircleShape2D.new()
	new_shape.radius = max(player_size.x, player_size.y) / 4
	$Area2D/PlayerCollisionShape.shape = new_shape


func _physics_process(delta):
	move()
	
	if wants_to_shoot(): shoot()


func _process(delta):
	# Get all cookies present in the map
	var cookies = get_tree().get_nodes_in_group("Cookie")
	for cookie in cookies:
		if $Area2D.overlaps_area(cookie):
			eat_cookie(cookie.value)
			game.delete_cookie(cookie.value)
			game_node.existing_cookies_updated.emit()
			cookie.queue_free()
			AudioScene.play_sfx(GameAssetsFactory.CookieCleanSFX)

func move():
	var target : Vector2 = get_global_mouse_position()
	var input_distance : float = position.distance_to(target)
	var input_direction : Vector2 = position.direction_to(target)
	var speed = MAX_SPEED
	
	if(wants_to_dash() and player.can_dash()):
		speed *= DASH_SPEED_MULTIPLIER
		on_player_dash()
	
	velocity = input_direction * speed
	velocity = velocity.normalized() * max(MIN_SPEED, max(speed, input_distance))
	
	move_and_slide()
	
	player.update(position)

func wants_to_dash():
	return Input.is_action_pressed("Dash")
	
func on_player_dash():
	player.dash()
	game_node.player_energy_updated.emit()
	get_tree().create_timer(2).connect("timeout", self.renew_energy)
	AudioScene.play_sfx(GameAssetsFactory.DashSFX)

func renew_energy():
	player.recover()
	game_node.player_energy_updated.emit()

func eat_cookie(cookie: Cookie):
	player.clean(cookie)
	ram.decrease(cookie)
	game_node.ram_updated.emit()
	game_node.player_points_updated.emit()
	game_node.existing_cookies_updated.emit()

func shoot():
	var attack = player_attack.instantiate()
	attack_point.look_at(get_global_mouse_position())
	attack.transform = attack_point.global_transform
	AudioScene.play_sfx(GameAssetsFactory.MouseAttackSFX)

	owner.add_child(attack)
	
func wants_to_shoot():
	return Input.is_action_just_pressed("ui_select")
