extends RichTextLabel

var game: Game
var browser: Browser

func _ready():
	game = SceneSwitcher.get_game_state()
	browser = game.enemy
	
	_on_existing_cookies_updated()

func _on_existing_cookies_updated():
	self.text = "%d" % browser.consumed_cookies_count
