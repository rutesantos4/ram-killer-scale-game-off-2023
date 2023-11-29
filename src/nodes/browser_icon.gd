extends TextureRect

func _ready():
	var skin = SceneSwitcher.get_game_state().enemy.skin
	self.texture = GameAssetsFactory.fromSkinAsset(skin).xs()
