extends Button
class_name TexturedButton

func _ready():
	self.connect("mouse_entered", _on_hover)

func _on_hover():
	AudioScene.play_sfx(GameAssetsFactory.HoverSFX)
