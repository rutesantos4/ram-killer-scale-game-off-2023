extends Enemy

class_name Browser

var _shock_skin: SkinAsset

func _init(
	skin: SkinAsset,
	initial_position: Vector2,
	initial_memory_size: float,
	shock_skin: SkinAsset
): 
	super(skin, initial_position, initial_memory_size)
	
	_shock_skin = shock_skin
	
func fire(target_position: Vector2):
	return ElectricalShock.new(
		_shock_skin,
		position,
		target_position
	)

func spawn() -> Array[Tab]:
	randomize()
	var tabs_to_spawn = randi_range(0, 6)
	var maximum_tabs_joint_memory_size = memory_size / 2
	var tabs: Array[Tab] = []
	
	for i in tabs_to_spawn:
		var tab_memory_size = maximum_tabs_joint_memory_size / tabs_to_spawn
		tabs.push_front(
			Tab.new(
				generate_tab_skin(),
				position, #TODO: https://github.com/rutesantos4/ram-killer-scale-game-off-2023/issues/42
				tab_memory_size
			)
		)
		
		memory_size -= tab_memory_size
	
	return tabs

func generate_tab_skin():
	var tabs = GameAssetsFactory.Tabs
	var index = randi_range(0, tabs.size() - 1)
	var tab = tabs[index]
	return SkinAsset.new(tab.get_name(), tab.s())
