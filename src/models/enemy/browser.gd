extends Enemy

class_name Browser

func _init(
	skin: SkinAsset,
	initial_size: float
): super(skin, initial_size)
	
func fire():
	#TODO: implement
	pass

func spawn():
	var tabs_to_spawn = randi_range(0, 6)
	var maximum_tabs_joint_memory_size = memory_size / 2
	var tabs = []
	
	for i in tabs_to_spawn:
		var tab_memory_size = maximum_tabs_joint_memory_size / tabs_to_spawn
		
		tabs.push_front(
			Tab.new(
				_skin,
				tab_memory_size
			)
		)
		
		memory_size -= tab_memory_size
	
	return tabs
