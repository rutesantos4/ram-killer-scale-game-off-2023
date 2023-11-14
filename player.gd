extends CharacterBody2D

const MAX_SPEED = 250.0
const MIN_SPEED = 50.0

func _ready():
	# Set the player image
	$PlayerSprite2D.texture = SceneSwitcher.get_game_info().get_player_image()
	# Set the player position
	$PlayerSprite2D.position.x = 0
	$PlayerSprite2D.position.y = 0


func _physics_process(delta):
	var target : Vector2 = get_global_mouse_position()
	var input_distance : float = position.distance_to(target)
	var input_direction : Vector2 = position.direction_to(target)
	
	velocity = input_direction * MAX_SPEED
	velocity = velocity.normalized() * max(MIN_SPEED, min(MAX_SPEED, input_distance))
	
	move_and_slide()
