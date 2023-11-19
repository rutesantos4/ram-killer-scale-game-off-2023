extends TextureRect

const BACKGROUND_SCALE = 2.5

func _ready():
	var map = SceneSwitcher.get_game_state().map
	
	show_behind_parent = true
	position.x = -map.size.x/2
	position.y = -map.size.y/2
	size = map.size
	
	create_map_limits()
	
	$Background.texture = map.skin.texture
	$Background.scale.x = BACKGROUND_SCALE
	$Background.scale.y = BACKGROUND_SCALE
	$Background.position.x = size.x/2
	$Background.position.y = size.y/2

func create_map_limits():
	var static_body = StaticBody2D.new()
	
	static_body.add_child(create_collision(Vector2(0, 0), Vector2(0, size.y)))
	static_body.add_child(create_collision(Vector2(0, 0), Vector2(size.x, 0)))
	static_body.add_child(create_collision(Vector2(0, size.y), Vector2(size.x, size.y)))
	static_body.add_child(create_collision(Vector2(size.x, size.y), Vector2(size.x, 0)))
	
	add_child(static_body)

func create_collision(pointA: Vector2, pointB: Vector2):
	var segment = SegmentShape2D.new()
	segment.a = pointA
	segment.b = pointB
	
	var collision = CollisionShape2D.new()
	collision.set_shape(segment)
	return collision
