extends Enemy

class_name Browser

const TAB_MEMORY_SIZE = 10
	
var _shock_skin: SkinAsset
var spawn_tabs: Array[Tab]

func _init(
	skin: SkinAsset,
	initial_position: Vector2,
	initial_memory_size: float,
	shock_skin: SkinAsset
): 
	super(skin, initial_position, initial_memory_size)
	
	_shock_skin = shock_skin
	spawn_tabs = []
	
func fire(target_position: Vector2):
	return ElectricalShock.new(
		_shock_skin,
		position,
		target_position
	)

func spawn() -> Array[Tab]:
	randomize()
	var maximum_tabs_joint_memory_size = memory_size - initial_memory_size
	var tabs: Array[Tab] = []
	var max_tabs_to_spawn = maximum_tabs_joint_memory_size / TAB_MEMORY_SIZE
	var tabs_to_spawn = randi_range(1, min(max_tabs_to_spawn, 6))
	
	for i in tabs_to_spawn:
		var tab = Tab.new(
				generate_tab_skin(),
				Vector2(randi_range(position.x, position.x + 250), randi_range(position.y, position.y + 250)), #TODO: https://github.com/rutesantos4/ram-killer-scale-game-off-2023/issues/42
				TAB_MEMORY_SIZE
			)
		tabs.push_front(tab)
		spawn_tabs.push_front(tab)
		memory_size += TAB_MEMORY_SIZE
	
	return tabs

func tab_closed(tab: Tab):
		memory_size -= tab.memory_size
		spawn_tabs.erase(tab)

func generate_tab_skin():
		var tabs = GameAssetsFactory.Tabs
		var index = randi_range(0, tabs.size() - 1)
		var tab = tabs[index]
		return SkinAsset.new(tab.get_name(), tab.s())
