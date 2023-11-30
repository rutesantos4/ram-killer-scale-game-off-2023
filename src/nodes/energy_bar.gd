extends TextureProgressBar

var player: Player

func _ready():
	player = SceneSwitcher.get_game_state().player
	
	self.value = player.energy

func _on_player_energy_updated():
	self.value = player.energy
