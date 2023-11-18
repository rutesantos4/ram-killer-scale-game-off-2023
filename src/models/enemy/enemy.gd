extends PositionalEntity

class_name Enemy

var memory_size: float

func _init(
	skin: SkinAsset,
	initial_position: Vector2,
	initial_memory_size: float
):
	super(skin, initial_position)

	memory_size = initial_memory_size

func consume(cookie: Cookie):
	memory_size += cookie.memory_size
