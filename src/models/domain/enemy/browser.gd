extends Enemy

class_name Browser


var initial_position: Vector2
var _shock_skin: SkinAsset
var spawn_tabs: Array[Tab]

func _init(
	skin: SkinAsset,
	initial_position: Vector2,
	initial_memory_size: float,
	shock_skin: SkinAsset
): 
	super(skin, initial_position, initial_memory_size)
	
	self.initial_position = initial_position
	_shock_skin = shock_skin
	spawn_tabs = []
	
func fire(target_position: Vector2) -> ElectricalShock:
	return ElectricalShock.new(
		_shock_skin,
		position,
		target_position
	)

func spawn() -> Array[Tab]:
	return TabSpawner.generate(self, memory_size - initial_memory_size)

func tab_closed(tab: Tab):
		memory_size -= tab.memory_size
		spawn_tabs.erase(tab)

func on_tab_cookie_consumed():
	self.consumed_cookies_count += 1
