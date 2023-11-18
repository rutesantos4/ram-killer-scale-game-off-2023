extends PositionalEntity

class_name ElectricalShock

var _target_position: Vector2

func _init(
	skin: SkinAsset,
	initial_position: Vector2,
	target_position: Vector2
):
	super(skin, initial_position)
	
	_target_position = target_position
