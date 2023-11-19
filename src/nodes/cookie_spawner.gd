extends Node2D

@export var cookie : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var game_state = SceneSwitcher.get_game_state()
	var cookies = game_state.cookies
	
	for _cookie in cookies:
		var c = cookie.instantiate()
		
		#TODO: FIX
		#c.get_node("CookieSprite2D").texture = _cookie.skin.texture
		c.position = _cookie.position
		c.value = _cookie
		
		add_child(c)
