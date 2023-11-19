extends PositionalEntity

class_name Cookie

var memory_size: float

func _init(
	skin: SkinAsset,
	initial_position: Vector2
):
	super(skin, initial_position)
	memory_size = 10
