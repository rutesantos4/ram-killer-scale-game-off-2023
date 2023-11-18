extends CharacterBody2D

const IN_SIGHT_DISTANCE_LIMIT = 400
const SPEED = 50.0
const LIMIT = 0.5

var player : Node
var closest_cookie_in_sight : Node

func _ready():
	player = get_parent().get_node("Player")
	var enemy_size : Vector2 = $Sprite2D.texture.get_size()
	var new_shape = CircleShape2D.new()
	new_shape.radius = max(enemy_size.x, enemy_size.y) / 4
	$Area2D/CollisionShape2D.shape = new_shape

func _physics_process(delta):
	update_velocity()
	try_eat_cookies()
	move_and_slide()

func update_velocity():
	if (is_player_in_sight()):
		move_to_player()
		closest_cookie_in_sight = null
	else:
		move_to_cookie()

func is_player_in_sight():
	return abs(position - player_position()).length() <= IN_SIGHT_DISTANCE_LIMIT

func player_position():
	return player.position

func move_to_player():
	var move_direction = player_position() - position
	velocity = move_direction.normalized() * SPEED

func move_to_cookie():
	closest_cookie_in_sight = closest_cookie()
	if(closest_cookie):
		var move_direction = closest_cookie_in_sight.position - position
		velocity = move_direction.normalized() * SPEED

func closest_cookie():
	if(closest_cookie_in_sight):
		return closest_cookie_in_sight
		
	var cookies = get_tree().get_nodes_in_group("Cookie")
	if (cookies.size() == 0):
		return
		
	var closest_cookie = cookies[0]
	for cookie in cookies:
		var cookie_distance = abs(position - cookie.position).length()
		if(cookie_distance < closest_cookie.position.length()):
			closest_cookie = cookie
			
	return closest_cookie

func try_eat_cookies():
	var cookies = get_tree().get_nodes_in_group("Cookie")
	
	for cookie in cookies:
		if $Area2D.overlaps_area(cookie):
			if(cookie == closest_cookie_in_sight):
				closest_cookie_in_sight = null
			cookie.queue_free()
