extends TextureProgressBar

var player: Player

func _ready():
	player = SceneSwitcher.get_game_state().player
	
	self.value = player.energy

func _on_player_health_updated():
	self.value = player.health
