extends Node2D

@export var cookie : PackedScene

const COOKIES_NUM = 100
const COOKIE_MIN_POSITION = -2000
const COOKIE_MAX_POSITION = 2000

# Called when the node enters the scene tree for the first time.
func _ready():
	# Generate n cookie
	for i in COOKIES_NUM:
		# Instanciate cookie
		var c = cookie.instantiate()
		# Add cookie as a child node
		add_child(c)
		randomize()
		# Set the position of the generated cookie
		c.position.x = randi_range(COOKIE_MIN_POSITION, COOKIE_MAX_POSITION)
		c.position.y = randi_range(COOKIE_MIN_POSITION, COOKIE_MAX_POSITION)

