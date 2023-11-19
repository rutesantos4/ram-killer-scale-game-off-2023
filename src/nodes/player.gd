extends CharacterBody2D

const MAX_SPEED = 250.0
const MIN_SPEED = 50.0
const DASH_SPEED_MULTIPLIER = 4.5

var player: Player

signal player_dashed

func _ready():
	player = SceneSwitcher.get_game_state().player
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
	var target : Vector2 = get_global_mouse_position()
	var input_distance : float = position.distance_to(target)
	var input_direction : Vector2 = position.direction_to(target)
	var speed = MAX_SPEED
	
	if(wants_to_dash() and player.can_dash()):
		speed *= DASH_SPEED_MULTIPLIER
		player.dash()
		player_dashed.emit()
	
	velocity = input_direction * speed
	velocity = velocity.normalized() * max(MIN_SPEED, max(speed, input_distance))
	
	move_and_slide()
	
	player.update(position)


func _process(delta):
	# Get all cookies present in the map
	var cookies = get_tree().get_nodes_in_group("Cookie")
	for cookie in cookies:
		if $Area2D.overlaps_area(cookie):
			player.clean(cookie.value)
			cookie.queue_free()

func wants_to_dash():
	return Input.is_key_pressed(KEY_SHIFT)
