extends Node2D

@export var cookie : PackedScene

const TIME_TO_SPAWN_SECONDS: float = 30
const MIN_COOKIES_TO_SPAWN: float = 1
const MAX_COOKIES_TO_SPAWN: float = 50

var game_node: GameScene
var game_state: Game

func _ready():
	game_node = get_tree().root.get_node("/root/Game")
	game_state = SceneSwitcher.get_game_state()
	add_cookies(game_state.cookies)
	handle_time_to_spawn()

func add_cookies(cookies: Array[Cookie]):
	for _cookie in cookies:
		var c = cookie.instantiate()
		
		c.get_node("CookieSprite2D").texture = _cookie.skin.texture
		c.position = _cookie.position
		c.value = _cookie
		
		add_child(c)

func generate_cookies():
	randomize()
	var cookies = CookieSpawner.generate(game_state.map.size, randi_range(MIN_COOKIES_TO_SPAWN, MAX_COOKIES_TO_SPAWN))
	add_cookies(cookies)
	game_state.add_cookies(cookies)
	game_node.existing_cookies_updated.emit()
	
func handle_time_to_spawn():
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.wait_time = TIME_TO_SPAWN_SECONDS
	timer.timeout.connect(generate_cookies)
	timer.start()
