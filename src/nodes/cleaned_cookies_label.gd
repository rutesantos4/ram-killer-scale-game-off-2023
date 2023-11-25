extends RichTextLabel

var player: Player

func _ready():
	player = SceneSwitcher.get_game_state().player
	
	_on_existing_cookies_updated()

func _on_existing_cookies_updated():
	self.text = "Cleaned Cookies: %d" % player.cleaned_cookies_count
