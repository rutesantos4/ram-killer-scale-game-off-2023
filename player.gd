extends CharacterBody2D

const SPEED = 300.0
const STOP_DISTANCE = 100.0

func _physics_process(delta):
	var target : Vector2 = get_global_mouse_position()
	var input_direction : Vector2 = position.direction_to(target)
	velocity = input_direction * SPEED
	var input_distance : float = position.distance_to(target)
	if input_distance > STOP_DISTANCE:
		move_and_slide()
	else:
		print(input_direction)
		if(velocity.x < 0):
			velocity = Vector2(velocity.x - STOP_DISTANCE, velocity.y).normalized() * SPEED
		else:
			velocity = Vector2(velocity.x + STOP_DISTANCE, velocity.y).normalized() * SPEED
		if(velocity.y < 0):
			velocity = Vector2(velocity.x, velocity.y - STOP_DISTANCE).normalized() * SPEED
		else:
			velocity = Vector2(velocity.x, velocity.y + STOP_DISTANCE).normalized() * SPEED
		move_and_slide()
		

