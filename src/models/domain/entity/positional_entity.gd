extends Entity

class_name PositionalEntity

var position: Vector2

func _init(
	skin: SkinAsset,
	initial_position: Vector2
):
	super(skin)
	position = initial_position

func update(position: Vector2): self.position = position
