extends Sprite2D

const BACKGROUND_SCALE = 2.5

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the background image
	texture = SceneSwitcher.get_game_state().map.skin.texture
	# Set the background scale
	scale.x = BACKGROUND_SCALE
	scale.y = BACKGROUND_SCALE
	# Set the background position
	position.x = 0
	position.y = 0
