extends RichTextLabel

var player: Player

func _ready():
	player = SceneSwitcher.get_game_state().player
	
	_on_player_points_updated()

func _on_player_points_updated():
	self.text = "%d" % player.points
