extends TextureProgressBar

var ram: RAM

func _ready():
	ram = SceneSwitcher.get_game_state().ram
	
	_on_ram_updated()
	
func _on_ram_updated():
	self.value = ram.current_memory_size
