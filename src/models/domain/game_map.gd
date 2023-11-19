extends Entity

class_name GameMap

var size: Vector2

func _init(
	skin: SkinAsset
): 
	super(skin)
	self.size = Vector2(8000, 4000)
