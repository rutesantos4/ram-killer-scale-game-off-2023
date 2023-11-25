extends CharacterBody2D

const IN_SIGHT_DISTANCE_LIMIT = 400
const SPEED = 50.0

var player: Node
var game_node: Node
var closest_cookie_in_sight: Node
var enemy: Enemy
var ram: RAM

func _ready():
	game_node = get_tree().root.get_node("/root/Game")
	player = game_node.get_node("Pausable/Player")
	ram = SceneSwitcher.get_game_state().ram


func _physics_process(delta):
	move_enemy()
	try_eat_cookies()
	move_and_slide()
	
	enemy.update(position)

func move_enemy():
	if (is_player_in_sight()):
		move_to_player()
		reset_closest_cookie()
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
	if(closest_cookie_in_sight):
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
		var closest_cookie_distance = abs(position - closest_cookie.position).length()
		if(cookie_distance < closest_cookie_distance):
			closest_cookie = cookie
			
	return closest_cookie

func try_eat_cookies():
	var cookies = get_tree().get_nodes_in_group("Cookie")
	
	for cookie in cookies:
		if $Area2D.overlaps_area(cookie):
			if(cookie == closest_cookie_in_sight):
				closest_cookie_in_sight = null
			eat_cookie(cookie.value)
			cookie.queue_free()

func eat_cookie(cookie: Cookie):
	enemy.consume(cookie)
	ram.increase(cookie)
	game_node.ram_updated.emit()
	game_node.existing_cookies_updated.emit()
	
	self.scale = enemy.get_scale(self.scale)

func reset_closest_cookie():
	closest_cookie_in_sight = null
