extends Button
class_name TexturedButton

func _ready():
	self.connect("mouse_entered", _on_hover)
	self.connect("pressed", _on_click)

func _on_hover():
	AudioScene.play_sfx(GameAssetsFactory.HoverSFX)

func _on_click():
	AudioScene.play_sfx(GameAssetsFactory.ClickSFX)
