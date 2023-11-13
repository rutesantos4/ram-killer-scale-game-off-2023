extends CharacterBody2D

const MAX_SPEED = 250.0
const MIN_SPEED = 50.0
const DASH_DISTANCE_MULTIPLIER = 3.0

func _shouldDash():
	return Input.is_key_pressed(KEY_SHIFT)

func _physics_process(delta):
	var target : Vector2 = get_global_mouse_position()
	var input_distance : float = position.distance_to(target)
	var input_direction : Vector2 = position.direction_to(target)
	
	if(_shouldDash()):
		input_distance *= DASH_DISTANCE_MULTIPLIER
	
	velocity = input_direction * MAX_SPEED
	velocity = velocity.normalized() * max(MIN_SPEED, max(MAX_SPEED, input_distance))
		
	move_and_slide()
