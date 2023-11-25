extends RichTextLabel

var game: Game

func _ready():
	game = SceneSwitcher.get_game_state()
		
	_on_existing_cookies_updated()

func _on_existing_cookies_updated():
	self.text = "Cookies: %d / %d" % [game.cookies.size(), game.cookies_spawned_count]
