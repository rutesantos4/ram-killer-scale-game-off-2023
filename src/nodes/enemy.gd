extends CharacterBody2D

const IN_SIGHT_DISTANCE_LIMIT = 400
const SPEED = 50.0

var player: Node
var game_node: GameScene
var closest_cookie_in_sight: Node
var game: Game
var enemy: Enemy
var ram: RAM

func _ready():
	game = SceneSwitcher.get_game_state()
	game_node = get_tree().root.get_node("/root/Game")
	player = game_node.get_node("Pausable/Player")
	ram = game.ram

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
	return get_current_position().distance_to(player_position()) <= (IN_SIGHT_DISTANCE_LIMIT * self.scale.x)

func player_position():
	return player.position

func move_to_player():
	var move_direction = get_current_position().direction_to(player_position())
	velocity = move_direction * SPEED

func move_to_cookie():
	var cookie = closest_cookie()
	if(is_instance_valid(cookie)):
		closest_cookie_in_sight = cookie
		var move_direction = get_current_position().direction_to(closest_cookie_in_sight.position)
		velocity = move_direction * SPEED

func get_current_position():
	return global_position

func closest_cookie():
	if(closest_cookie_in_sight):
		return closest_cookie_in_sight
		
	var cookies = get_all_cookies()
	if (cookies.size() == 0):
		return
		
	var closest_cookie = cookies[0]
	for cookie in cookies:
		var cookie_distance = position.distance_to(cookie.position)
		var closest_cookie_distance = position.distance_to(closest_cookie.position)
		if(cookie_distance < closest_cookie_distance):
			closest_cookie = cookie
			
	return closest_cookie

func try_eat_cookies():
	var cookies = get_all_cookies()
	
	for cookie in cookies:
		if $Area2D.overlaps_area(cookie):
			if(cookie == closest_cookie_in_sight):
				reset_closest_cookie()
			eat_cookie(cookie.value)
			cookie.queue_free()
			AudioScene.play_sfx(GameAssetsFactory.CookieEatSFX)

func eat_cookie(cookie: Cookie):
	enemy.consume(cookie)
	ram.increase(cookie)
	game.delete_cookie(cookie)
	game_node.ram_updated.emit()
	game_node.existing_cookies_updated.emit()
	
	self.scale = enemy.get_scale(self.scale)

func reset_closest_cookie():
	closest_cookie_in_sight = null

func get_all_cookies():
	return get_tree().get_nodes_in_group("Cookie")
